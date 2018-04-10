<?php defined('BASEPATH') or exit('No direct script access allowed');

class Module_Calendar extends Module
{
    public $version = '0.1.10';

    public function info()
    {
        return array(
            'name' => array(
                'fr' => 'Semainier',
            ),
            'description' => array(
                'fr' => 'Calendrier semaine',
            ),
            'frontend' => true,
            'backend' => true,
            'menu' => 'content',
            'sections' => array(
                'calendar' => array(
                    'name' => 'Semainier',
                    'uri' => 'admin/calendar',
                    // 'shortcuts' => array(
                        // 'create' => array(
                            // 'name' => 'calendar:new',
                            // 'uri' => 'admin/calendar/create',
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
                                            'slug' => 'jours_ouverts',
                                            'title' => 'Jours ouverts',
                                            'description' => 'Les jours d\'ouverture (Non implementé)',
                                            'default' => '1',
                                            'value' => '1,2,3,4,5',
                                            'type' => 'checkbox',
                                            '`options`' => '1=Lundi|2=Mardi|3=Mercredi|4=Jeudi|5=Vendredi|6=Samedi|7=Dimanche',
                                            'is_required' => 1,
                                            'is_gui' => 1,
                                            'module' => 'calendar',
                                            'order' => 660,
                                ),
                    
                );
				
		$this->db->delete('settings', array('module' => 'calendar'));
		
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

        $this->db->delete('settings', array('module' => 'calendar'));
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