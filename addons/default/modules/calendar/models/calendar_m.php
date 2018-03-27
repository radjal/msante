<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Calendar_m extends MY_Model {
    
 	public function __construct()
	{		
		parent::__construct();
		
		//$this->_table = 'calendars';
	}       
        
	public function calculate_week($week_no=false)
	{
		// day no JS compatible sun=0
		$days[1] = 'lundi';
		$days[2] = 'mardi';
		$days[3] = 'mercredi';
		$days[4] = 'jeudi';
		$days[5] = 'vendredi';
		$days[6] = 'samedi';
		$days[7] = 'dimanche';
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
	
		$isodaysshort[1] = 'lun' ;
		$isodaysshort[2] = 'mar' ;
		$isodaysshort[3] = 'mer' ;
		$isodaysshort[4] = 'jeu' ;
		$isodaysshort[5] = 'ven' ;
		$isodaysshort[6] = 'sam' ;
		$isodaysshort[7] = 'dim' ;
		
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
		
		// @todo correct week if necessary?
		$start_date = new DateTime();
		$start_date -> setISODate($data['year'],$data['week'], 1);
		$data['week_begin'] = $start_date -> format('Y-m-d');
		$data['week_begin_day'] = $start_date -> format('j');
		$data['week_begin_day_no'] = $start_date -> format('w');
		$data['week_begin_day_iso'] = $start_date -> format('N');
		$data['week_begin_day_name'] = $days[$data['week_begin_day_no']];
		$data['week_begin_month'] = $months[$start_date -> format('n')];
		$data['week_begin_month_no'] = $start_date -> format('n');
                
		// @todo week days as param
		$dtstamp = strtotime($data['week_begin'], time());
		$end_date = $dtstamp;
//		$end_date += 4*24*3600; // add 4 days, just for the week days 
		$end_date += 6*24*3600; 
		$data['week_finish'] = date('Y-m-d', $end_date);
		$data['week_finish_day'] = date('j', $end_date);
		$data['week_finish_day_no'] = date('w', $end_date);
		$data['week_finish_day_iso'] = date('N', $end_date);
		$data['week_finish_day_name'] = $days[$data['week_finish_day_no']];
		$data['week_finish_month'] = $months[date('n', $end_date)];
		$data['week_finish_month_no'] = date('n', $end_date); 
                // first step/day for days of week
                $data['week_dates_iso'][1]['date'] = date('Y-m-d', $dtstamp) ;
                $data['week_dates_iso'][1]['day'] = date('j', $dtstamp); 
                $data['week_dates_iso'][1]['dayname'] = $isodays[1] ;
                $data['week_dates_iso'][1]['dayshortname'] = $isodaysshort[1] ; 
                // LOOP calcluate dates for each subsequent day of week
                for ($i = 2; $i <= 7; $i++) {
                    $dtstamp += 1*24*3600 ;// add a day
                    $data['week_dates_iso'][$i]['date'] = date('Y-m-d', $dtstamp ) ;
                    $data['week_dates_iso'][$i]['day'] = date('j', $dtstamp ) ; 
                    $data['week_dates_iso'][$i]['dayname'] = $isodays[$i] ;
                    $data['week_dates_iso'][$i]['dayshortname'] = $isodaysshort[$i] ;
                }
                
                $data['isodays'] = $isodays;
                $data['months'] = $months;
                
		return $data;
	}
        
        /** 
         * create array of periods for a day 24H within start and stop limits
         * one hour periods
         * 
         * @param int $interval max=60
         * @param int $start
         * @param int $end
         * @return array
         */
        public function periods_make_day($interval='30', $start='1000', $end='1700', $break='1200', $breakend="1430")
        {
            $ret = []; 
            $hour = str_pad($start, 4, '0', STR_PAD_LEFT);  
                    for($hour ; (int)$hour<=(int)$end ; $hour )
                    {   
                        $hh = substr($hour,0,2);
                        $mm = substr($hour,2,2); 
                        $hour =  str_pad($hh.$mm, 4, '0', STR_PAD_LEFT); 
                        $line['hour'] = $hh ;
                        $line['dt'] = $hour ;   
                        $line['break'] = $hour < $break ||  $hour >= $breakend  ? 'false' : 'true' ; 
                        //FIX above 60' interval bug
                        if($mm+$interval >= 60) 
                        {
                                $xi = $interval;
                                while ( $mm+$xi >= 60 )
                                { 
                                    $hh = ($mm+$xi)>=60 ? $hh + 1 : $hh; //+1H
                                    $xi -= ($mm+$xi)>=60 ? 60 : $xi; 
                                    $mm += $xi;  
                                }
                                $mm = str_pad($mm, 2, '0', STR_PAD_LEFT);
                                $hour =  str_pad((string)$hh.(string)$mm, 4, '0', STR_PAD_LEFT);
                        } else {
                                $hour =  str_pad((string)$hh.((int)$mm+(int)$interval), 4, '0', STR_PAD_LEFT); 
                        } 
                        $line['end'] = $hour ;  
                        $ret[] = $line; 
                    } 
                return $ret;
        } 
        
        /** function for periods_make_day()
         *  calculates number of divisions within an hour based on interval
         * 
         * @param in $hour
         * @param in $interval
         * @return array
         */
        public function _periods_hours($hour, $interval)
        { 
                $line['hour']=$line['dt']=$time=$hour;  
                for ($h = 0; $h < 60; $h = $h + $interval )
                {
                        $time = str_pad($hour + $h, 4, '0', STR_PAD_LEFT) ;
//                        $line['hour']=$time;
                        $line['dt']=$time; 
                $ret[]=$line;
                } 
                return $ret;  
        }
                
        public function html_caldots($appointments)
	{		
            $html = ''; 
            foreach ($appointments as $period ) 
            {    
                        $html.= '<a href="#" title="doc_id:'. $period['doctor_id'].' user_id:'. $period['user_id'].' time:'. $period['appointment_time'].' ">&bullet;</a> ';   
            }
            return $html; 
	} 
        
                
        public function periods_splice_arrays($dayArr, $apptsArr)
        {
            $initialized = false; 
            $interval = $dayArr[1]['dt'] - $dayArr[0]['dt'];
                foreach ($dayArr as $index => $period) 
                {    
                        if(!$initialized) 
                        {
                            $start = $dayArr[$index]['dt'];
                            $initialized=true; 
                        } else {
                            $end = $dayArr[$index]['dt'];
                            $dayArr[$index-1]['end']=$end;
                            $start=$end;//previous
                            //splice, check on last value
                            $apptsArr;
                            while (count($apptsArr)>0 && $apptsArr[0]['appointment_time']<$end) 
                            {
                                $dayArr[$index-1]['appointment'][] = array_shift($apptsArr);  
                            }  
                        }   
                }
            //last
            $dayArr[$index]['end'] = 'false'; 
            $dayArr[$index]['last'] = 'true'; 
            return $dayArr;
        }
        
	// get file
	public function getfile($filepath, $output=false)
	{
		$output = strtolower($output);
		$path = ADDONPATH."modules/calendar/$filepath";
		
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
        
	public function produits($day_cat_no = null, $week_cat_id = null, $type_id = null, $orderby='name', $orderdir='asc', $limit=10)
	{
//            $sql_cat_filter = 'GROUP BY default_products.id ';
//            $offset = 0;
//            if(!empty($day_cat_no)) $cat_slugids[] = $day_cat_no ;
//            if(!empty($week_cat_id)) $cat_slugids[] = $week_cat_id ;
//            if(!empty($type_id)) $cat_slugids[] = $type_id ;
//                    
//            $cats_count = count($cat_slugids);
//            $cat_slugids = implode(', ', $cat_slugids);
//
//            $sql_cat_filter = "AND default_products_assign_cat.category_id IN($cat_slugids) 
//                                GROUP BY default_products.id 
//                                HAVING COUNT(default_products.id) = $cats_count";
//
//            $sql = "SELECT default_products.*
//                                FROM default_products
//                                    JOIN default_products_assign_cat ON default_products.id = default_products_assign_cat.product_id    
//                                    JOIN default_products_categories ON default_products_assign_cat.category_id = default_products_categories.id
//                                WHERE 
//                                active = 1 
//                                $sql_cat_filter
//                                ORDER BY default_products.id DESC
//                                LIMIT $limit OFFSET $offset
//                    ";
//            
//            $query = $this->db->query($sql);
//            $ret = $query->result_array();
            return $ret;
	}       
        
        public function category_id($name)
	{		
//            $query = $this->db->get_where('products_categories', array('name' => $name), 1);
//            $res = $query->row_array();
//            return $res['id'];
	} 
        

}