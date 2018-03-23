
<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Based on the custom Plugin
 *
 *
 * @author		Radja Lomas
 * @package		
 * @copyright	
 */
class Plugin_Reservation extends Plugin
{ 
	public $version = '1.0.2';

	public $name = array(
		'en'	=> 'Reservation plugin'
	);

	public $description = array(
		'en'	=> 'Reservation helpers for general use.'
	);

	/**
	 * Returns a PluginDoc array that PyroCMS uses 
	 * to build the reference in the admin panel
	 *
	 * All options are listed here but refer 
	 * to the Blog plugin for a larger custom
	 *
	 * @return array
	 */
	public function _self_doc()
	{
		$info = array(
			'hello' => array(
				'description' => array(// a single sentence to explain the purpose of this method
					'en' => 'General custom helpers'
				),
				'single' => true,// will it work as a single tag?
				'double' => false,// how about as a double tag?
				'variables' => '',// list all variables available inside the double tag. Separate them|like|this
				'attributes' => array(
					'name' => array(// this is the name="World" attribute
						'type' => 'text',// Can be: slug, number, flag, text, array, any.
						'flags' => '',// flags are predefined values like asc|desc|random.
						'default' => 'World',// this attribute defaults to this if no value is given
						'required' => false,// is this attribute required?
					),
				),
			),
		);
	
		return $info;
	}

        /** returns prestations as select options without select tag
         * id=parent_id of pages tree used for listing
		 
         * {{ reservation:prestations limit="5" order="asc" id="2" order_by="id" }}
         * 
         */
        function prestations() 
        {           
            	// params
		$limit = $this->attribute('limit') ;
		$order = $this->attribute('order');
		$id = $this->attribute('id'); 
		$slug = $this->attribute('slug');
		$order_by = !empty($this->attribute('order_by')) ? $this->attribute('order_by') : 'title'; 
                
            // query setting
                if(!empty($id)) $this->db->where("pages.parent_id","$id"); 
                if(!empty($slug)) $this->db->where("pages.slug",$slug);
                if(!empty($limit)) $this->db->limit($limit);
                if(!empty($order)) $this->db->order_by("pages.$order_by", $order); 
                
                $this->db->join('pages_soin', 'pages.entry_id = pages_soin.id', 'full');
                $prestations = $this->db->get('pages')->result_array();
                        //flatten array
                        $newlist =[];
                        $opt_start = '<option data-prix="' ; 
                        $opt_start_mid = '" data-duree="'; 
                        $opt_start_close = '">'; 
                        $opt_close_tag = '</option>'; 
                        foreach($prestations as $k => $v) 
                        { 
                              $name = ucfirst($v['title']);
                              if( ! empty( $v['prix_30_min'] )) $newlist[]=     $opt_start.$v['prix_30_min'].$opt_start_mid .'30'.        $opt_start_close .$name.' &bullet; 30 minutes &bullet; '          .$v['prix_30_min'].'€' .$opt_close_tag ;
                              if( ! empty( $v['prix_60_min'] )) $newlist[]=     $opt_start.$v['prix_60_min'].$opt_start_mid .'60'.     $opt_start_close .$name.' &bullet; 60 minutes &bullet; '          .$v['prix_60_min'].'€' .$opt_close_tag ;
                              if( ! empty( $v['prix_90_min'] )) $newlist[]=     $opt_start.$v['prix_90_min'].$opt_start_mid    .'90'.     $opt_start_close .$name.' &bullet; 90 minutes &bullet; '          .$v['prix_90_min'].'€' .$opt_close_tag ;
                              if( ! empty( $v['prix_120_min'] )) $newlist[]=    $opt_start.$v['prix_120_min'].$opt_start_mid      .'120'.   $opt_start_close .$name.' &bullet; 120 minutes &bullet; '         .$v['prix_120_min'].'€' .$opt_close_tag ;
                              if( ! empty( $v['prix_60_min_duo'] )) $newlist[]= $opt_start.$v['prix_60_min_duo'].$opt_start_mid     .'60'.    $opt_start_close .$name.' &bullet; 60 minutes en duo &bullet; '   .$v['prix_60_min_duo'].'€' .$opt_close_tag ; 
                        }                       
			  
              return implode("\r\n", $newlist);
        }   	
}

/* End of file custom_user.php */