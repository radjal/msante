<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Based on the Example Plugin
 *
 *
 * @author		Radja Lomas
 * @package		
 * @copyright	
 */
class Plugin_Custom_User extends Plugin
{
	public $version = '1.0.0';

	public $name = array(
		'en'	=> 'Custom User '
	);

	public $description = array(
		'en'	=> 'Custom user helper.'
	);

	/**
	 * Returns a PluginDoc array that PyroCMS uses 
	 * to build the reference in the admin panel
	 *
	 * All options are listed here but refer 
	 * to the Blog plugin for a larger example
	 *
	 * @return array
	 */
	public function _self_doc()
	{
		$info = array(
			'hello' => array(
				'description' => array(// a single sentence to explain the purpose of this method
					'en' => 'Custom user'
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

	/**
	 * update user profile field
	 *
	 * Usage:
	 * {{ custom_user:update_user_profile field="fieldname" }}
	 *
	 * @param string $fieldname     The field to update
	 * @return boolean
	 */
	function update_user_profile()
	{
            $fieldname = $this->attribute('fieldname');
            //get POST variables
            $fieldvalue = $this->input->post($fieldname);
             
            if ($fieldname === false)
            {
                return false; // Exit if we do not have field name
            }
            
           if (!isset($fieldvalue) OR empty($fieldvalue))
            {
                return false; // Exit if we do not have a value to update
            }

            $user_id = $this->current_user->id;
            if(!isset($user_id) or empty($user_id))
            {
                return false;
            }
            
            $data = array( 'scripts' => $fieldvalue );

            $this->db->where('id', $user_id);
            $res = $this->db->update('profiles', $data); 
            
            $this->load->helper('url'); // refresh page
            $location = base_url().uri_string();
            redirect($location, 'refresh');
	}
        
        
}

/* End of file example.php */