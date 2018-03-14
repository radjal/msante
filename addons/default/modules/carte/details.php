<?php defined('BASEPATH') or exit('No direct script access allowed');

class Module_Carte extends Module
{
    public $version = '0.98';

    public function info()
    {
        return array(
            'name' => array(
                'fr' => 'Carte',
            ),
            'description' => array(
                'fr' => 'Module de carte semaine',
            ),
            'frontend' => true,
            'backend' => true,
            'menu' => 'content',
            'sections' => array(
                'carte' => array(
                    'name' => 'Carte',
                    'uri' => 'admin/carte',
                    // 'shortcuts' => array(
                        // 'create' => array(
                            // 'name' => 'carte:new',
                            // 'uri' => 'admin/carte/create',
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
                                            'description' => 'Les jours d\'ouverture',
                                            'default' => '1',
                                            'value' => '1,2,3,4,5',
                                            'type' => 'checkbox',
                                            '`options`' => '1=Lundi|2=Mardi|3=Mercredi|4=Jeudi|5=Vendredi|6=Samedi|0=Dimanche',
                                            'is_required' => 1,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 660,
                                ),
                                array(
                                'slug' => 'msg_global',
                                            'title' => 'Message global',
                                            'description' => '',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 661,
                                ),
                                array(
                                'slug' => 'msg_lundi',
                                            'title' => 'Message pour le lundi',
                                            'description' => '',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 662,
                                ),
                                array(
                                'slug' => 'cat_lundi',
                                            'title' => 'Numéro catégorie lundi',
                                            'description' => 'Numéro de la catégorie produit pour le lundi',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 663,
                                ),
                                array(
                                'slug' => 'msg_mardi',
                                            'title' => 'Message pour le mardi',
                                            'description' => '',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 664,
                                ),
                                array(
                                'slug' => 'cat_mardi',
                                            'title' => 'Numéro catégorie mardi',
                                            'description' => 'Numéro de la catégorie produit pour le mardi',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 665,
                                ),
                                array(
                                'slug' => 'msg_mercredi',
                                            'title' => 'Message pour le mercredi',
                                            'description' => '',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 666,
                                ),
                                array(
                                'slug' => 'cat_mercredi',
                                            'title' => 'Numéro catégorie mercredi',
                                            'description' => 'Numéro de la catégorie produit pour le mercredi',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 667,
                                ),
                                array(
                                'slug' => 'msg_jeudi',
                                            'title' => 'Message pour le jeudi',
                                            'description' => '',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 668,
                                ),
                                array(
                                'slug' => 'cat_jeudi',
                                            'title' => 'Numéro catégorie jeudi',
                                            'description' => 'Numéro de la catégorie produit pour le jeudi',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 669,
                                ),
                                array(
                                'slug' => 'msg_vendredi',
                                            'title' => 'Message pour le vendredi',
                                            'description' => '',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 670,
                                ),
                                array(
                                'slug' => 'cat_vendredi',
                                            'title' => 'Numéro catégorie vendredi',
                                            'description' => 'Numéro de la catégorie produit pour le vendredi',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 671,
                                ),
                                array(
                                'slug' => 'msg_samedi',
                                            'title' => 'Message pour le samedi',
                                            'description' => '',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 672,
                                ),
                                array(
                                'slug' => 'cat_samedi',
                                            'title' => 'Numéro catégorie samedi',
                                            'description' => 'Numéro de la catégorie produit pour le samedi',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 673,
                                ),
                                array(
                                'slug' => 'msg_dimanche',
                                            'title' => 'Message pour le dimanche',
                                            'description' => '',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 674,
                                ),
                                array(
                                'slug' => 'cat_dimanche',
                                            'title' => 'Numéro catégorie dimanche',
                                            'description' => 'Numéro de la catégorie produit pour le dimanche',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 675,
                                ),
                                array(
                                'slug' => 'no_cat_entree',
                                            'title' => 'Numéro catégorie entrée',
                                            'description' => 'Numéro de la catégorie produit pour les entrées',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 676,
                                ),
                                array(
                                'slug' => 'no_cat_plat',
                                            'title' => 'Numéro catégorie plat',
                                            'description' => 'Numéro de la catégorie produit pour les plats principaux',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 677,
                                ),
                                array(
                                'slug' => 'no_cat_dessert',
                                            'title' => 'Numéro catégorie dessert',
                                            'description' => 'Numéro de la catégorie produit pour les desserts',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 678,
                                ),
                                array(
                                'slug' => 'no_cat_boissons',
                                            'title' => 'Numéro catégorie boissons',
                                            'description' => 'Numéro de la catégorie produit pour les boissons',
                                            'type' => 'text',
                                            'default' => '',
                                            'value' => '',
                                            'options' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'carte',
											'order' => 679,
                                ),
                    
                );
				
		$this->db->delete('settings', array('module' => 'carte'));
		
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