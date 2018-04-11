<?php defined('BASEPATH') or exit('No direct script access allowed');

class Module_Inscription extends Module
{
    public $version = '0.0.1';

    public function info()
    {
        return array(
            'name' => array(
                'fr' => 'Inscription',
            ),
            'description' => array(
                'fr' => 'Inscription',
            ),
            'frontend' => true,
            'backend' => true,
            'menu' => 'content',
            'sections' => array(
                'inscription' => array(
                    'name' => 'Inscription',
                    'uri' => 'admin/inscription',
                    // 'shortcuts' => array(
                        // 'create' => array(
                            // 'name' => 'inscription:new',
                            // 'uri' => 'admin/inscription/create',
                            // 'class' => 'add'
                        // )
                    // )
                )
            )
        );
    }

    /**
     * Install
     *
     */
    public function install()
    {
		
		$orders_settings = array(
                                array(
                                            'slug' => 'url_cas_1',
                                            'title' => 'url_cas_1',
                                            'description' => 'Cas No1',
                                            'default' => '',
                                            'value' => '',
                                            'type' => 'text',
                                            '`options`' => '',
                                            'is_required' => 1,
                                            'is_gui' => 1,
                                            'module' => 'inscription',
                                            'order' => 660,
                                ),
                                array(
                                            'slug' => 'url_cas_2',
                                            'title' => 'url_cas_2',
                                            'description' => 'Cas No2',
                                            'default' => '',
                                            'value' => '',
                                            'type' => 'text',
                                            '`options`' => '',
                                            'is_required' => 1,
                                            'is_gui' => 1,
                                            'module' => 'inscription',
                                            'order' => 660,
                                ),
                                array(
                                            'slug' => 'url_cas_3',
                                            'title' => 'url_cas_3',
                                            'description' => 'Cas No3',
                                            'default' => '',
                                            'value' => '',
                                            'type' => 'text',
                                            '`options`' => '',
                                            'is_required' => 1,
                                            'is_gui' => 1,
                                            'module' => 'inscription',
                                            'order' => 660,
                                ),
                    
                );
				
		$this->db->delete('settings', array('module' => 'inscription'));
		
		foreach ($orders_settings as $setting)
		{
			if ( ! $this->db->insert('settings', $setting))
			{
				return false;
			}
		}

        return true;
    }

    /**
     * Uninstall
     *
     * Uninstall our module - this should tear down
     * all information associated with it.
     */
    public function uninstall()
    {

        $this->db->delete('settings', array('module' => 'inscription'));
        return true;
    }

    public function upgrade($old_version)
    {
        return true;
    }

    public function help()
    {
        // Return a string containing help info
        // You could include a file and return it here.
        return "No documentation has been added for this module.<br />Contact the module developer for assistance.";
    }

}