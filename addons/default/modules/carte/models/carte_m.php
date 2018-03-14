<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Carte_m extends MY_Model {
    
 	public function __construct()
	{		
		parent::__construct();
		
		//$this->_table = 'cartes';
	}       
        
	public function produits($day_cat_no = null, $week_cat_id = null, $type_id = null, $orderby='name', $orderdir='asc', $limit=10)
	{
            $sql_cat_filter = 'GROUP BY default_products.id ';
            $offset = 0;
            if(!empty($day_cat_no)) $cat_slugids[] = $day_cat_no ;
            if(!empty($week_cat_id)) $cat_slugids[] = $week_cat_id ;
            if(!empty($type_id)) $cat_slugids[] = $type_id ;
                    
            $cats_count = count($cat_slugids);
            $cat_slugids = implode(', ', $cat_slugids);

            $sql_cat_filter = "AND default_products_assign_cat.category_id IN($cat_slugids) 
                                GROUP BY default_products.id 
                                HAVING COUNT(default_products.id) = $cats_count";

            $sql = "SELECT default_products.*
                                FROM default_products
                                    JOIN default_products_assign_cat ON default_products.id = default_products_assign_cat.product_id    
                                    JOIN default_products_categories ON default_products_assign_cat.category_id = default_products_categories.id
                                WHERE 
                                active = 1 
                                $sql_cat_filter
                                ORDER BY default_products.id DESC
                                LIMIT $limit OFFSET $offset
                    ";
            
            $query = $this->db->query($sql);
            $ret = $query->result_array();
            return $ret;
	}       
        
        public function category_id($name)
	{		
            $query = $this->db->get_where('products_categories', array('name' => $name), 1);
            $res = $query->row_array();
            return $res['id'];
	}
        
	public function produits_old($pc_slug, $catid='', $orderby='name', $orderdir='asc', $limit=10)
	{
        
                $this->db->join('products_categories', 'products_categories.id = products.id ');
                $this->db->select('products.*, products_categories.id as pc_id, products_categories.name as pc_name, products_categories.slug as pc_slug,');
                
                if(!empty($catid)) $this->db->where("cat_id", $catid);
                
                $this->db->where("products_categories.slug", $pc_slug);
//                $this->db->where("parent_cid", $pcid);
                $this->db->limit($limit);
                $this->db->order_by($orderby, $orderdir);
                $res = $this->db->where('active', 1)->get('products')->result_array();
            return $res;
	}       
        
	public function produits_old1($day_cat_no, $week_cat_id, $parent_cid, $orderby='name', $orderdir='asc', $limit=10)
	{
                //$this->db->join('products_categories', 'products_categories.id = products.cat_id ');
                $this->db->select('products.*');
//                $this->db->select('products.*, products_categories.id as pc_id, products_categories.name as pc_name, products_categories.slug as pc_slug,');
                

                $this->db->where("parent_cid", $parent_cid);
                $this->db->where("active", 1);
//                $this->db->where_in("cat_id", $week_cat_id );
//                $this->db->where_in("cat_id", $day_cat_no );
                $this->db->like("cat_id", $week_cat_id, 'both');
                $this->db->like("cat_id", $day_cat_no, 'both');
                $this->db->limit($limit);
                $this->db->order_by($orderby, $orderdir);
                $res = $this->db->get('products')->result_array();
            return $res;
	}       
        
	public function calcul_semaine($week_no=false)
	{
		// day no JS compatible sun=0
		$days[1] = 'lundi';
		$days[2] = 'mardi';
		$days[3] = 'mercredi';
		$days[4] = 'jeudi';
		$days[5] = 'vendredi';
		$days[6] = 'samedi';
		$days[0] = 'dimanche';
	
		$months[1] = 'janvier';
		$months[2] = 'février';
		$months[3] = 'mars';
		$months[4] = 'avril';
		$months[5] = 'mai';
		$months[6] = 'juin';
		$months[7] = 'juillet';
		$months[8] = 'aout';
		$months[9] = 'septembre';
		$months[10] = 'octobre';
		$months[11] = 'novembre';
		$months[12] = 'décembre';
	
		$isodays['lundi']       = 1 ;
		$isodays['mardi']       = 2 ;
		$isodays['mercredi']    = 3 ;
		$isodays['jeudi']       = 4 ;
		$isodays['vendredi']    = 5 ;
		$isodays['samedi']      = 6 ;
		$isodays['dimanche']    = 7 ;
	
		$isodays[1] = 'lundi' ;
		$isodays[2] = 'mardi' ;
		$isodays[3] = 'mercredi' ;
		$isodays[4] = 'jeudi' ;
		$isodays[5] = 'vendredi' ;
		$isodays[6] = 'samedi' ;
		$isodays[7] = 'dimanche' ;
		
		// set current week and year
		$data['week'] = !$week_no ? date("W") : $week_no ;
		$data['today_week'] = date("W") ;
		$data['month_no'] = date("n") ;
		$data['month_name'] = $months[$data['month_no']] ;
		$data['year'] = date("Y") ;
		$data['today'] = date("Y-m-d") ;    
		$data['today_no'] = date("w") ;     
		$data['today_day'] = date("j") ;    
		$data['today_no_iso'] = date("N") ;    
		$data['next_week_no'] = str_pad($data['week'] +1, 2, 0, STR_PAD_LEFT) ;
		$data['previous_week_no'] = str_pad($data['week'] -1, 2, 0, STR_PAD_LEFT) ;
		
		// @todo correct week if necessary
		$start_date = new DateTime();
		$start_date -> setISODate($data['year'],$data['week']);
		$data['week_begin'] = $start_date -> format('Y-m-d');
		$data['week_begin_day'] = $start_date -> format('j');
		$data['week_begin_day_no'] = $start_date -> format('w');
		$data['week_begin_day_iso'] = $start_date -> format('N');
		$data['week_begin_day_name'] = $days[$data['week_begin_day_no']];
		
		$dtstamp = strtotime($data['week_begin'], time());
		$end_date = $dtstamp;
		$end_date += 4*24*3600; // add 4 days, just for the week days 
		$data['week_finish'] = date('Y-m-d', $end_date);
		$data['week_finish_day'] = date('j', $end_date);
		$data['week_finish_day_no'] = date('w', $end_date);
		$data['week_finish_day_iso'] = date('N', $end_date);
		$data['week_finish_day_name'] = $days[$data['week_finish_day_no']];
		
                // calcluate dates for each day of week
                $data['week_dates_iso'][1]['date'] = date('Y-m-d', $dtstamp) ;
                $data['week_dates_iso'][1]['day'] = date('j', $dtstamp); 
                for ($i = 2; $i <= 7; $i++) {
                    $dtstamp += 1*24*3600 ;// add a day
                    $data['week_dates_iso'][$i]['date'] = date('Y-m-d', $dtstamp ) ;
                    $data['week_dates_iso'][$i]['day'] = date('j', $dtstamp ) ; 
                }
                
                $data['isodays'] = $isodays;
                
		return $data;
	}
        
	// get file
	public function getfile($filepath, $output=false)
	{
		$output = strtolower($output);
		$path = ADDONPATH."modules/carte/$filepath";
		
		if(!empty($path)) $content = file_get_contents($path); 
		
		switch($output) {
			case 'json':
				$content = json_encode($content);
				break;
			case 'oneline':
				$order   = array("\r\n", "\n", "\r");
				$content = str_replace($order, ' ', $content);
				$content = str_replace("'", "\'", $content);
				break;
			default :
				break;
		}
		return $content;
	}
        

}