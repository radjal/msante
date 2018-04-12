<?php defined('BASEPATH') or exit('No direct script access allowed');

class Module_Doctor extends Module
{
    public $version = '0.1.27';

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
			'roles' => array(
				'edit', 'delete', 'create', 'set_location'
			),
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
                ),
                'organisations' => array(
                    'name' => 'doctor:organisations',
                    'uri' => 'admin/doctor/organisations/index',
                    'shortcuts' => array(
                        'create' => array(
                            'name' => 'doctor:organisation:new',
                            'uri' => 'admin/doctor/organisations/create',
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
        $this->db->delete('settings', array('module' => 'doctor'));
        // We're using the streams API to
        // do data setup.
        $this->load->driver('Streams'); 
        //just in case, remove streams first
        $this->streams->utilities->remove_namespace('doctor');  
        //db forge drop for favs table as e are not using streams for that one
        $this->dbforge->drop_table('doctors_favorites');
        // Add doctors streams
        if ( ! $this->streams->streams->add_stream('lang:doctor:doctors', 'doctors', 'doctor', 'doctor_', null)) return false;
        if ( ! $categories_stream_id = $this->streams->streams->add_stream('lang:doctor:categories', 'categories', 'doctor', 'doctor_', null)) return false;
        if ( ! $organisations_stream_id = $this->streams->streams->add_stream('lang:doctor:organisations', 'organisations', 'doctor', 'doctor_', null)) return false;
 
        // Create image folder
        $this->load->library('files/files');
        $imgfolder = Files::create_folder(0, 'Doctor images');
        
        // doctor fields for streams
        if(1)
        {
                    $fields = array(
                        //doctors
                        array(
                            'name' => 'Practicien validé',
                            'slug' => 'validated',
                            'namespace' => 'doctor',
//                            'type' => 'text',
                            'type' => 'choice',
                            'extra' => array('choice_data' => "yes : lang:global:yes
                                        no : lang:global:no", 
                                        'choice_type' => 'radio', 
                                        'default_value' => 'no'),
                            'assign' => 'doctors',
                            'required' => true 
                        ), 
                        array(
                            'name' => 'Nom du practicien',
                            'slug' => 'name',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'extra' => array('max_length' => 200),
                            'assign' => 'doctors',
                            'required' => true 
                        ), 
                        array(
                            'name' => 'RNGPS',
                            'slug' => 'rngps',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'extra' => array('max_length' => 11),
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
                                        7 : dimanche", 
                                        'choice_type' => 'checkboxes', 
                                        'default_value' => "1\n\r2\n\r3\n\r4\n\r5"),
                            'assign' => 'doctors',
                            'required' => true,
                            'unique' => false
                        ),
//                        array(
//                            'name' => 'Heures d\'ouverture',
//                            'slug' => 'hours',
//                            'namespace' => 'doctor',
//                            'type' => 'text',
//                            'extra' => array('max_length' => 200),
//                            'assign' => 'doctors',
//                            'required' => false 
//                        ),
                        array(
                            'name' => 'Paramètres semaine',
                            'slug' => 'week_settings',
                            'namespace' => 'doctor',
                            'type' => 'text',
//                            'extra' => array('max_length' => 10),// encapsed object of settings for each day of the week, use JSON or PHP 
                            'assign' => 'doctors',
                            'required' => false 
                        ),
                        array(
                            'name' => 'Début de vacance',
                            'slug' => 'vacation_start',
                            'namespace' => 'doctor',
                            'type' => 'date',
                            'extra' => array('max_length' => 10),// yyyy-mm-dd
                            'assign' => 'doctors',
                            'required' => false 
                        ),
                        array(
                            'name' => 'Fin de vacance',
                            'slug' => 'vacation_end',
                            'namespace' => 'doctor',
                            'type' => 'date',
                            'extra' => array('max_length' => 10),// yyyy-mm-dd
                            'assign' => 'doctors',
                            'required' => false 
                        ), 
                        array(
                            'name' => 'Civilité',
                            'slug' => 'gender',
                            'namespace' => 'doctor',
                            'type' => 'choice',
                            'extra' => array('choice_data' => "Homme\n\rFemme", 
                                        'choice_type' => 'radio', 
                                        'default_value' => ''),
                            'assign' => 'doctors',
                            'required' => false 
                        ), 
//                        array(
//                            'name' => 'Civilité',
//                            'slug' => 'gender',
//                            'namespace' => 'doctor',
//                            'type' => 'text',
//                            'extra' => array('max_length' => 10),// homme|femme
//                            'assign' => 'doctors',
//                            'required' => false 
//                        ), 
                        array(
                            'name' => 'Téléphone',
                            'slug' => 'telephone',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'doctors',
                            'extra' => array('max_length' => 20),
                            'required' => false
                        ),
                        array(
                            'name' => 'Mobile',
                            'slug' => 'mobile',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'doctors',
                            'extra' => array('max_length' => 20),
                            'required' => false
                        ),
                        array(
                            'name' => 'Email',
                            'slug' => 'email',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'doctors',
                            'extra' => array('max_length' => 160),
                            'required' => false
                        ),
                        array(
                            'name' => 'Adresse',
                            'slug' => 'address',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'doctors',
                            'extra' => array('max_length' => 200),
                            'required' => false
                        ),
                        array(
                            'name' => 'Quartier',
                            'slug' => 'area_name',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'doctors',
                            'extra' => array('max_length' => 200),
                            'required' => false
                        ),
                        array(
                            'name' => 'Commune',
                            'slug' => 'district',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'doctors',
                            'extra' => array('max_length' => 200),
                            'required' => false
                        ),
                        array(
                            'name' => 'Ville',
                            'slug' => 'town',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'doctors',
                            'extra' => array('max_length' => 200),
                            'required' => false
                        ),
                        //extras
                        array(
                            'name' => 'Description',
                            'slug' => 'description',
                            'namespace' => 'doctor',
                            'type' => 'textarea',
                            'assign' => 'doctors',
                            'required' => false
                        ),
                        array(
                            'name' => 'Informations d\'accès',
                            'slug' => 'access',
                            'namespace' => 'doctor',
                            'type' => 'textarea',
                            'assign' => 'doctors',
                            'extra' => array('max_length' => 200),
                            'required' => false
                        ),
                        array(
                            'name' => 'Langues parlées',
                            'slug' => 'languages',
                            'namespace' => 'doctor',
                            'type' => 'textarea',
                            'assign' => 'doctors',
                            'extra' => array('max_length' => 200),
                            'required' => false
                        ),
                        array(
                            'name' => 'Formation',
                            'slug' => 'diploma',
                            'namespace' => 'doctor',
                            'type' => 'textarea',
                            'assign' => 'doctors',
                            'extra' => array('max_length' => 200),
                            'required' => false
                        ),
                        array(
                            'name' => 'Tarifs et mutuelle',
                            'slug' => 'fees',
                            'namespace' => 'doctor',
                            'type' => 'textarea',
                            'assign' => 'doctors',
                            'extra' => array('max_length' => 200),
                            'required' => false
                        ),
                        array(
                            'name' => 'Moyens de paiement',
                            'slug' => 'payment',
                            'namespace' => 'doctor',
                            'type' => 'textarea',
                            'assign' => 'doctors',
                            'extra' => array('max_length' => 200),
                            'required' => false
                        ),
//                        array(
//                            'name' => 'Mutuelle',
//                            'slug' => 'insurance',
//                            'namespace' => 'doctor',
//                            'type' => 'text',
//                            'assign' => 'doctors',
//                            'extra' => array('max_length' => 3),
//                            'required' => false
//                        ),
                        array(
                            'name' => 'Mutuelle',
                            'slug' => 'insurance',
                            'namespace' => 'doctor',
                            'type' => 'choice',
                            'extra' => array('choice_data' => "yes : lang:global:yes
                                        no : lang:global:no", 
                                        'choice_type' => 'radio', 
                                        'default_value' => 'no'),
                            'assign' => 'doctors',
                            'required' => false,
                            'unique' => false
                        ),
                        array(
                            'name' => 'Visites à domicile',
                            'slug' => 'homecall',
                            'namespace' => 'doctor',
                            'type' => 'choice',
                            'extra' => array('choice_data' => "yes : lang:global:yes
                                        no : lang:global:no", 
                                        'choice_type' => 'radio', 
                                        'default_value' => 'no'),
                            'assign' => 'doctors',
                            'extra' => array('max_length' => 3),
                            'required' => false
                        ),
                        array(
                            'name' => 'Latitude',
                            'slug' => 'latitude',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'doctors',
//                            'extra' => array('max_length' => 3), 
                            'required' => false
                        ),
                        array(
                            'name' => 'Longitude',
                            'slug' => 'longitude',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'doctors',
//                            'extra' => array('max_length' => 3),
                            'required' => false
                        ),
                        array(
                            'name' => 'Réglages semaine',
                            'slug' => 'settings',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'doctors',
//                            'extra' => array('max_length' => 3),
                            'required' => false
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
                        //category relationship
                        array(
                            'name' => 'Catégorie',
                            'slug' => 'doctor_cat',
                            'namespace' => 'doctor',
                            'type' => 'relationship',
                            'assign' => 'doctors',
                            'extra' => array('choose_stream' => $categories_stream_id)
                        ),
                        //categories
                        array(
                            'name' => 'Spécialité médicale',
                            'slug' => 'speciality',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'categories',
                            'title_column' => true,
                            'required' => true,
                            'unique' => true
                        ),
                        array(
                            'name' => 'Catégorie parente',
                            'slug' => 'parent_cat',
                            'namespace' => 'doctor',
                            'type' => 'relationship',
                            'assign' => 'categories',
                            'extra' => array('choose_stream' => $categories_stream_id),
                            'required' => false
                        ),
                        array(
                            'name' => 'Mots clés',
                            'slug' => 'keywords',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'categories',
                            'title_column' => true,
                            'required' => false,
                            'unique' => false
                        ),
                        array(
                            'name' => 'Image catégorie',
                            'slug' => 'doc_cat_image',
                            'namespace' => 'doctor',
                            'type' => 'image',
                             'extra' => array('folder' => $imgfolder['data']['id'], 'required' => FALSE), // use id of folder created with core files modules
                            'assign' => 'categories', 
                            'required' => false
                        ), 
                        //organisation relationship
                        array(
                            'name' => 'Organisme ou groupe',
                            'slug' => 'groupe',
                            'namespace' => 'doctor',
                            'type' => 'relationship',
                            'assign' => 'doctors',
                            'extra' => array('choose_stream' => $organisations_stream_id)
                        ),
                        //organisations 
                        array(
                            'name' => 'Structure',
                            'slug' => 'organisation',
                            'namespace' => 'doctor',
                            'type' => 'relationship',
                            'assign' => 'organisations',
                            'extra' => array('choose_stream' => $organisations_stream_id)
                        ),
                        array(
                            'name' => 'Etablissement',
                            'slug' => 'subset',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'organisations',
                            'title_column' => true,
                            'required' => true,
                            'unique' => true
                        ),            
                    );
        }
        //update streams
        $this->streams->fields->add_fields($fields);
        //admin views
        if(1){
            $this->streams->streams->update_stream('doctors', 'doctor', array(
                'view_options' => array(
    //                'id',
                    'days',
                    'description',
                    'groupe',
                    'doctor_cat'
                )
            )); 
            $this->streams->streams->update_stream('categories', 'doctor', array(
                'view_options' => array(
    //                'id',
                    'parent_cat',
                    'speciality',
                )
            ));
            $this->streams->streams->update_stream('organisations', 'doctor', array(
                'view_options' => array(
    //                'id',
                    'organisation', 
                    'subset', 
                )
            )); 
            
        }
        //module settings
        if(1){ 
        $doctor_settings = array(
                        array(
                                    'slug' => 'days_open',
                                    'title' => 'Jours ouverts',
                                    'description' => 'Les jours d\'ouverture (Non implementé)',
                                    'default' => '1',
                                    'value' => '1,2,3,4,5',
                                    'type' => 'checkbox',
                                    '`options`' => '1=Lundi|2=Mardi|3=Mercredi|4=Jeudi|5=Vendredi|6=Samedi|7=Dimanche',
                                    'is_required' => 1,
                                    'is_gui' => 1,
                                    'module' => 'doctor',
                                    'order' => 660,
                        ),
                        array(
                                    'slug' => 'opens',
                                    'title' => 'Ouverture',
                                    'description' => 'L\'heure d\'ouverture (Non implementé)',
                                    'type' => 'text',
                                    'default' => '0900',
                                    'value' => '',
                                    'options' => '',
                                    'is_required' => 1,
                                    'is_gui' => 1,
                                    'module' => 'doctor',
                                    'order' => 662,
                        ),
                        array(
                                    'slug' => 'closes',
                                    'title' => 'Fermeture',
                                    'description' => 'L\'heure de fermeture. (Non implementé)',
                                    'type' => 'text',
                                    'default' => '1700',
                                    'value' => '',
                                    'options' => '',
                                    'is_required' => 1,
                                    'is_gui' => 1,
                                    'module' => 'doctor',
                                    'order' => 662,
                        ),
                        array(
                                    'slug' => 'break_start',
                                    'title' => 'Début de la pause',
                                    'description' => 'L\'heure de début de la pause midi. (Non implementé)',
                                    'type' => 'text',
                                    'default' => '1200',
                                    'value' => '',
                                    'options' => '',
                                    'is_required' => 1,
                                    'is_gui' => 1,
                                    'module' => 'doctor',
                                    'order' => 662,
                        ),
                        array(
                                    'slug' => 'break_stop',
                                    'title' => 'Fin de la pause',
                                    'description' => 'L\'heure de fin de la pause midi. (Non implementé)',
                                    'type' => 'text',
                                    'default' => '1400',
                                    'value' => '',
                                    'options' => '',
                                    'is_required' => 1,
                                    'is_gui' => 1,
                                    'module' => 'doctor',
                                    'order' => 662,
                        ),

        );
        }
        foreach ($doctor_settings as $setting)
        {
                if ( ! $this->db->insert('settings', $setting))
                {
                        return false;
                }
        }
        //add favs table outside of streams 
        if(1) 
        {
            
		$favorites_table = array(
                                                'id' => array(
                                                                'type' => 'INT',
                                                                'constraint' => '11',
                                                                'auto_increment' => TRUE,
                                                                'primary' => true,
                                                                ),
                                                'doctor_id' => array(
                                                                'type' => 'INT',
                                                                'constraint' => '11',
                                                                ),
                                                'user_id' => array(
                                                                'type' => 'INT',
                                                                'constraint' => '11',
                                                                ),
						'created_on' => array(
                                                                'type'       => 'datetime',
                                                                'default'    => '1970-01-01 00:00:00',
                                                                'null' => TRUE
                                                                ),
						'updated_on' => array(
                                                                'type'       => 'datetime',
                                                                'default'    => '1970-01-01 00:00:00',
                                                                'null' => TRUE
                                                                ),
						);

        }
        // can install multiple tables 
        if ( ! $this->install_tables( array('doctors_favorites' => $favorites_table ) ) )
        {
			return  false;
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
        $this->load->driver('Streams');

        // For this teardown we are using the simple remove_namespace
        // utility in the Streams API Utilties driver.
        $this->streams->utilities->remove_namespace('doctor'); 
        $this->db->delete('settings', array('module' => 'appointments')); 
        $this->dbforge->drop_table('doctors_favorites');

        return true;
    }

    public function upgrade($old_version)
    {
        $this->load->driver('Streams');
         
        if(version_compare($this->version, '0.0.01', '<=') ) 
        {   //DB forge method
                $table = array(
                        'parent' => array( 'type' => 'VARCHAR', 'constraint' => '255', 'unique' => false, 'null' => TRUE),
                        );

                 if( !$this->dbforge->add_column('doctor_categories', $table) ) return false;
        }
        if(version_compare($this->version, '0.0.05', '<=') ) 
        { //DB forge method
            $this->dbforge->drop_column('doctor_categories', 'parent');
            return true;
        }
        if(version_compare($this->version, '0.0.06', '<=') ) 
        {  //Streams method
                $categories_stream_id = $this->streams->streams->get_stream('categories', 'doctor' );
                $fields = array(
                        array(
                            'name' => 'Catégorie parente',
                            'slug' => 'parent',
                            'namespace' => 'doctor',
                            'type' => 'text',
                            'assign' => 'categories',
                            'required' => false
                        ),
                );
        
                $this->streams->fields->add_fields($fields);
        }
        if(version_compare($this->version, '0.0.09', '<=') ) 
        { 
            //DB forge method           
                $data = array(
                   'field_name' => 'Quartier'
                ); 
                $this->db->where('field_slug', 'area_name'); // value
                $this->db->update('data_fields', $data);  // table 
        } 
        if(version_compare($this->version, '0.0.91', '<=') ) 
        {  
            //new stream for organisations
            if ( ! $organisations_stream_id = $this->streams->streams->add_stream('lang:doctor:organisations', 'organisations', 'doctor', 'doctor_', null)) return false; 
            //organisations
            $fields = array(
                            array(
                                'name' => 'Organismes',
                                'slug' => 'organisation',
                                'namespace' => 'doctor',
                                'type' => 'relationship',
                                'assign' => 'organisations',
                                'extra' => array('choose_stream' => $organisations_stream_id)
                            ),
                            array(
                                'name' => 'Nom organisme',
                                'slug' => 'subset',
                                'namespace' => 'doctor',
                                'type' => 'text',
                                'assign' => 'organisations',
                                'title_column' => true,
                                'required' => true,
                                'unique' => true
                            )); 
            //update
            $this->streams->fields->add_fields($fields);
            //admin views
            $this->streams->streams->update_stream('organisations', 'doctor', array(
                'view_options' => array(
                    'id',
                    'organisation', 
                )
            ));
        }
        if(version_compare($this->version, '0.0.92', '<=') ) 
        {
            $this->streams->streams->update_stream('categories', 'doctor', array(
                'view_options' => array(
                    'id',
                    'parent',
                    'speciality',
                )
            ));
            $this->streams->streams->update_stream('organisations', 'doctor', array(
                'view_options' => array(
                    'id',
                    'subset', 
                )
            )); 
        }
         
        return true;
    }

    public function help()
    {
        // Return a string containing help info
        // You could include a file and return it here.
        return "No documentation has been added for this module.<br />Contact the module developer for assistance.";
    }

}