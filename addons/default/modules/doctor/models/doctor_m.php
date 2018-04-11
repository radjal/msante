<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Doctor_m extends MY_Model 
{
 	public function __construct()
	{		
		parent::__construct();
		
		$this->_table = 'doctors';
	}       
                        
        /** return doctor from DB
         * 
         * @param int $doc_id
         * @return array
         */
        public function get_categories($parent=null, $images=false)
        { 
            $this->db->select('doctor_categories.id, doctor_categories.parent_cat, doctor_categories.speciality, doctor_categories.keywords'); 
            $this->db->select('files.filename'); 
            $this->db->join('files', 'doctor_categories.doc_cat_image = files.id', 'left');
            if(!empty($parent) && $parent != 'null') $this->db->where( 'doctor_categories.parent_cat', $parent ); 
            if($images) $this->db->where( 'doctor_categories.doc_cat_image <> ', ''); 
                
            $res = $this->db 
                            ->order_by('ordering_count desc, name desc') 
                            ->get('doctor_categories')
                            ->result_array();  
            return $res;
        } 
        
                        
        /** return doctor from DB
         * 
         * @param int $doc_id
         * @return array
         */
        public function get_doctor($doc_id=false)
        {
            if($doc_id == false) return ;
            
            $this->db->select('doctor_doctors.*');
            $this->db->select('doctor_categories.*');
            $this->db->select('doctor_organisations.*');
            $this->db->select('files.filename AS img_path'); 
                                
            $this->db->join('doctor_categories', 'doctor_categories.id = doctor_doctors.doctor_cat', 'left');
            $this->db->join('doctor_organisations', 'doctor_doctors.groupe = doctor_organisations.id', 'left');
            $this->db->join('files', 'doctor_doctors.image = files.id', 'left');
                
            $res = $this->db->where('doctor_doctors.id', $doc_id)
                            ->get('doctor_doctors')
                            ->result_array();  
            return $res[0];
        } 
        
        /** @todo finish?...
         * 
         * @param type $selected
         * @param type $extra
         * @return string
         */
        public function form_checkbox_days($selected, $extra='class="width-15"')
        {
                $html  =form_checkbox('days', 'weekday_1', $selected == 'weekday_1', $extra); 
                $html .=lang('doctor:weekday_1');
                    $html .=form_checkbox('days', 'weekday_2', $selected == 'weekday_1', $extra); 
                    $html .=lang('doctor:weekday_1');
                        $html .=form_checkbox('days', 'weekday_3', $selected == 'weekday_1', $extra); 
                        $html .=lang('doctor:weekday_1');
                            $html .=form_checkbox('days', 'weekday_4', $selected == 'weekday_1', $extra); 
                            $html .=lang('doctor:weekday_1');
                            $html .='test';
                return $html ;
        }
        
        /** return list of days from day streams choice array or space separated string of day names
         * 
         * @param array or str $days
         * @return type
         */
        public function days_to_str($days) 
        {
            if(empty($days) or $days == null) return ;
            //open days as string for template usage   
            $str='';
            if(is_string($days))
            { 
                foreach ($days as $day ) 
                { 
                        $str .= $day . ","; 
                }  
            } else {
                foreach ($days as $day ) 
                { 
                        $str .= $day["value"] . ","; 
                } 
            }
            $str = trim($str, ',');//removes the final comma 
            return $str; 
        }
        
        /** 
         * returns filename of speciality if known
         * 
         * @param str $speciality
         * @return string
         */
        public function speciality_img($speciality) 
        { 
                switch (strtolower($speciality)) 
                {
                 case strtolower( "Ophtalmologue"): 
                     $filename = 'da81bbdd7f739e786f674638e29ba433.jpg'; 
                     break;
                 case strtolower("ORL" ): 
                     $filename = '29edb0b1c84e0ed4df17c82fe658d9d5.jpg'; 
                     break;
                 case strtolower("Spécialistes femme"): 
                     $filename = '41f6ec9ed1a988081b7e137dee039c0d.jpg'; 
                     break;
                 case strtolower("Radiologue"): 
                     $filename = 'c9c12e653b087854ac27bf50eac5a6cc.jpg'; 
                     break;
                 case strtolower("dentiste"): 
                     $filename = '1717f2a8194f53253de0df0c7f5f998c.jpg'; 
                     break;
                 case strtolower("Autres médecins"): 
                     $filename = 'e6ef08347e274fc655f20c172baad122.jpg'; 
                     break;
                 case strtolower("Etablissements de santé"): 
                     $filename = '056d27356ff595697ce2352501d71633.jpg'; 
                     break;
                 case strtolower("Médecins généralistes"): 
                     $filename = 'e6ef08347e274fc655f20c172baad122.jpg'; 
                     break;  
                 default:
                     $filename = '8b37a2a2cbf9537714125a8f8476e63a.jpg'; //default image
                     break;
                }
                return $filename; 
        }
        
        // get file
	public function getfile($filepath, $output=false)
	{
		$output = strtolower($output);
		$path = ADDONPATH."modules/doctor/$filepath";
		
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