<?php defined('BASEPATH') or exit('No direct script access allowed');

class Module_Doctor extends Module
{
    public $version = '1.0.0';

    public function info()
    {
        return array(
            'name' => array(
                'en' => 'Doctors',
                'fr' => 'Docteurs',
            ),
            'description' => array(
                'en' => 'Doctors list',
                'fr' => 'Liste des Docteurs',
            ),
            'frontend' => true,
            'backend' => true,
            'menu' => 'content',
            'sections' => array(
                'doctor' => array(
                    'name' => 'doctor:doctors',
                    'uri' => 'admin/doctor',
                    'shortcuts' => array(
                        'create' => array(
                            'name' => 'doctor:new',
                            'uri' => 'admin/doctor/create',
                            'class' => 'add'
                        )
                    )
                ),
                'categories' => array(
                    'name' => 'doctor:categories',
                    'uri' => 'admin/doctor/categories/index',
                    'shortcuts' => array(
                        'create' => array(
                            'name' => 'doctor:category:new',
                            'uri' => 'admin/doctor/categories/create',
                            'class' => 'add'
                        )
                    )
                )
            )
        );
    }

    /**
     * Install
     *
     * This function will set up our
     * FAQ/Category streams.
     */
    public function install()
    {
        // We're using the streams API to
        // do data setup.
        $this->load->driver('Streams');
        
        //just in case
        $this->streams->utilities->remove_namespace('doctor');
		
        //$this->load->language('doctor');
//        $this->lang->load('doctor');

        // Add doctors streams
        if ( ! $this->streams->streams->add_stream('lang:doctor:doctors', 'doctors', 'doctor', 'doctor_', null)) return false;
        if ( ! $categories_stream_id = $this->streams->streams->add_stream('lang:doctor:categories', 'categories', 'doctor', 'doctor_', null)) return false;

        
        
        // Create image folder
        $this->load->library('files/files');
        $imgfolder = Files::create_folder(0, 'doctors');
        
        // Add some fields
        $fields = array(
            array(
                'name' => 'Nom du docteur',
                'slug' => 'name',
                'namespace' => 'doctor',
                'type' => 'textarea',
                'extra' => array('max_length' => 200),
                'assign' => 'doctors',
                'required' => false 
            ),
            array(
                'name' => 'Jours ouverts',
                'slug' => 'days',
                'namespace' => 'doctor',
                'type' => 'choice',
                'extra' => array('choice_data' => "1 : lundi
                            2 : mardi
                            3 : mercredi
                            4 : jeudi
                            5 : vendredi
                            6 : samedi
                            0 : dimanche", 
                            'choice_type' => 'checkboxes', 
                            'default_value' => ''),
                'assign' => 'doctors',
                'required' => false,
                'unique' => false
            ),
            array(
                'name' => 'Heures d\'ouverture',
                'slug' => 'hours',
                'namespace' => 'doctor',
                'type' => 'textarea',
                'extra' => array('max_length' => 200),
                'assign' => 'doctors',
                'required' => false 
            ),
            array(
                'name' => 'Description',
                'slug' => 'description',
                'namespace' => 'doctor',
                'type' => 'textarea',
                'assign' => 'doctors',
                'required' => false
            ),
            array(
                'name' => 'Téléphone',
                'slug' => 'telephone',
                'namespace' => 'doctor',
                'type' => 'text',
                'assign' => 'doctors',
                'required' => false
            ),
            array(
                'name' => 'Mobile',
                'slug' => 'mobile',
                'namespace' => 'doctor',
                'type' => 'text',
                'assign' => 'doctors',
                'required' => false
            ),
            array(
                'name' => 'Email',
                'slug' => 'email',
                'namespace' => 'doctor',
                'type' => 'text',
                'assign' => 'doctors',
                'required' => false
            ),
            array(
                'name' => 'Adresse',
                'slug' => 'address',
                'namespace' => 'doctor',
                'type' => 'text',
                'assign' => 'doctors',
                'required' => true
            ),
            array(
                'name' => 'Ville',
                'slug' => 'town',
                'namespace' => 'doctor',
                'type' => 'text',
                'assign' => 'doctors',
                'required' => true
            ),
            array(
                'name' => 'Code postal',
                'slug' => 'postcode',
                'namespace' => 'doctor',
                'type' => 'text',
                'assign' => 'doctors',
                'required' => true
            ),
            array(
                'name' => 'Image docteur',
                'slug' => 'image',
                'namespace' => 'doctor',
                'type' => 'image',
		 'extra' => array('folder' => $imgfolder['data']['id'], 'required' => FALSE), // use id of folder created with core files modules
                'assign' => 'doctors',
                'required' => false
            ),
            array(
                'name' => 'Domain id',
                'slug' => 'dom_id',
                'namespace' => 'doctor',
                'type' => 'text',
                'assign' => 'doctors',
                'required' => false
            ),
            array(
                'name' => 'Titre categorie',
                'slug' => 'doctor_cat_title',
                'namespace' => 'doctor',
                'type' => 'text',
                'assign' => 'categories',
                'title_column' => true,
                'required' => true,
                'unique' => true
            ),
            array(
                'name' => 'Domain id',
                'slug' => 'cat_dom_id',
                'namespace' => 'doctor',
                'type' => 'text',
                'assign' => 'categories',
                'required' => false
            ),
            array(
                'name' => 'Catégorie',
                'slug' => 'doctor_cat',
                'namespace' => 'doctor',
                'type' => 'relationship',
                'assign' => 'doctors',
                'extra' => array('choose_stream' => $categories_stream_id)
            )
        );

        $this->streams->fields->add_fields($fields);

        $this->streams->streams->update_stream('doctors', 'doctor', array(
            'view_options' => array(
                'id',
                'days',
                'description',
                'doctor_cat'
            )
        ));

        $this->streams->streams->update_stream('categories', 'doctor', array(
            'view_options' => array(
                'id',
                'doctor_cat_title'
            )
        ));

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
        $this->load->driver('Streams');

        // For this teardown we are using the simple remove_namespace
        // utility in the Streams API Utilties driver.
        $this->streams->utilities->remove_namespace('doctor');

        return true;
    }

    public function upgrade($old_version)
    {
        //1.0.1
        /* STREAMS UPDATE DOESN'T WORK AS I THOUGHT
                $categories_stream_id = $this->streams->streams->get_stream('categories', 'doctor' );
                $fields = array(
            array(
                'name' => 'Nom du docteur',
                'slug' => 'name',
                'namespace' => 'doctor',
                'type' => 'textarea',
                'extra' => array('max_length' => 200),
                'assign' => 'doctors',
                'required' => false 
            ),
            array(
                'name' => 'Catégorie',
                'slug' => 'doctor_cat',
                'namespace' => 'doctor',
                'type' => 'relationship',
                'assign' => 'doctors',
                'extra' => array('choose_stream' => $categories_stream_id)
            )
        );
        
        $this->load->driver('Streams');
        $this->streams->streams->update_stream('doctors', 'doctor', $fields);
         */
        // BELOW IS FOR ADDING FIELDS
        /*
        $fields = array(

                        array(
                            'name' => 'Domain id',
                            'slug' => 'dom_id',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'doctors',
                            'required' => false
                        ),
                        array(
                            'name' => 'Domain id',
                            'slug' => 'cat_dom_id',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'categories',
                            'required' => false
                        ),  
                 ); 
        */ 
        
//        $this->streams->fields->add_fields($fields);
        
        return true;
    }

    public function help()
    {
        // Return a string containing help info
        // You could include a file and return it here.
        return "No documentation has been added for this module.<br />Contact the module developer for assistance.";
    }

}