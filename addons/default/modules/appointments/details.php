<?php defined('BASEPATH') or exit('No direct script access allowed');

class Module_Appointments extends Module {

	public $version = '0.1.20';

	public function info()
	{
		return array(
			'name' => array(
				'en' => 'Appointments(Commandes)',
				'fr' => 'Rendez vous',
			),
			'description' => array(
				'en' => 'Appointments module',
				'fr' => 'Module de rendez vous'
			),
			'frontend' => TRUE,
			'backend' => TRUE,
			'menu' => 'content', // You can also place modules in their top level menu. For example try: 'menu' => 'Appointments',
			'sections' => array(
				'items' => array(
					'name' 	=> 'appointments:items', // These are translated from your language file
					'uri' 	=> 'admin/appointments',
						'shortcuts' => array(
							'create' => array(
								'name' 	=> 'appointments:create',
								'uri' 	=> 'admin/appointments/create',
								'class' => 'add'
								)
							)
						),
//                                    'list' => array(
//					'name' => 'appointments:list_title',
//					'uri' => 'admin/appointments/list',
//					),
				)
		);
	}

	public function install()
	{
                    $appointments_list = array(
                                                'id' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'auto_increment' => TRUE,
                                                            'primary' => true,
                                                            ),
						'user_id' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'default' => 0
                                                            ),
						'doctor_id' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'default' => 0
                                                            ),
//						'name' => array(
//                                                            'type' => 'VARCHAR',
//                                                            'constraint' => '100'
//                                                            ),
//						'slug' => array(
//                                                            'type' => 'VARCHAR',
//                                                            'constraint' => '100'
//                                                            ),
						'appointment_status' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '100',
                                                            'default' => '',
                                                            ),
						'appointment_date' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'default' => 0
                                                            ), 
//						'appointment_date' => array(
//                                                            'type'       => 'datetime',
//                                                            'default'    => '1970-01-01 00:00:01',
//                                                            'null' => TRUE
//                                                            ), 
//						'appointment_time' => array(
//                                                            'type' => 'VARCHAR',
//                                                            'constraint' => '20',
//                                                            'null' => TRUE
//                                                            ),
						'appointment_time' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '4',
                                                            'default' => 0000
                                                            ),
						'message' => array(
                                                            'type' => 'TEXT',
                                                            'null' => TRUE
                                                            ), 
						'maiden_name' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '120',
                                                            'default' => '',
                                                            ),						
						'first_name' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '60',
                                                            'default' => '',
                                                            ),								
						'last_name' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '60',
                                                            'default' => '',
                                                            ),								
						'gender' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '10',
                                                            'default' => '',
                                                            ),		
						'other_person' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '3',
                                                            'default' => 'no'
                                                            ),				
						'knows_doctor' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '3',
                                                            'default' => 'no'
                                                            ),				
                                                'phone' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '20',
                                                            'default' => '',
                                                            ),
					 	 'mobile' => array(
                                                             'type' => 'VARCHAR',
                                                             'constraint' => '20',
                                                             'default' => '',
                                                             ),
						 'email' => array(
                                                             'type' => 'VARCHAR',
                                                             'constraint' => '80',
                                                             'default' => '',
                                                             ), 
						'address' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '250',
                                                            'default' => '',
                                                            ), 
						'town' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '120',
                                                            'default' => '',
                                                            ),
						'area_name' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '100',
                                                            'default' => '',
                                                            ), 
						'payment_type' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '100',
                                                            'default' => '',
                                                            ),
						'payment_status' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '100',
                                                            'default' => '',
                                                            ),
						'total_pretax' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '11',
                                                            'default' => 0,
                                                            ),						
						'total_final' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '11',
                                                            'default' => 0,
                                                            ),	
                                                        'ip' => array(
                                                             'type' => 'VARCHAR',
                                                             'constraint' => '255',
                                                             'null' => TRUE
                                                             ),
                                                 'user_agent' => array(
                                                             'type' => 'VARCHAR',
                                                             'constraint' => '255',
                                                             'null' => TRUE
                                                             ),
						'created_on' => array(
                                                            'type'       => 'datetime',
                                                            'default'    => '1970-01-01 00:00:01',
                                                            'null' => TRUE
                                                            ),
						'updated_on' => array(
                                                            'type'       => 'datetime',
                                                            'default'    => '1970-01-01 00:00:01',
                                                            'null' => TRUE
                                                            ),
						);


		$appointments_details = array(
                                                'id' => array(
                                                                'type' => 'INT',
                                                                'constraint' => '11',
                                                                'auto_increment' => TRUE,
                                                                'primary' => true,
                                                                ),
                                                'appointment_id' => array(
                                                                'type' => 'INT',
                                                                'constraint' => '11',
                                                                ),
                                                 'product_id' => array(
                                                                 'type' => 'INT',
                                                                 'constraint' => '11',
                                                                 ), 
						'created_on' => array(
                                                                'type'       => 'datetime',
                                                                'default'    => '1970-01-01 00:00:01',
                                                                'null' => TRUE
                                                                ),
						'updated_on' => array(
                                                                'type'       => 'datetime',
                                                                'default'    => '1970-01-01 00:00:01',
                                                                'null' => TRUE
                                                                ),
						);

		$appointments_settings = array(
                /*                 // array(
                                            // 'slug' => 'seller_email',
                                            // 'title' => 'Adresse email du vendeur',
                                            // 'description' => 'Adresse email du gestionnaire des commandes. Par défault l\'email de contact du site. Plusieurs mails possible, séparés par virgule.',
                                            // '`default`' => '',
                                            // '`value`' => '',
                                            // 'type' => 'text',
                                            // '`options`' => '',
                                            // 'is_required' => 1,
                                            // 'is_gui' => 1,
                                            // 'module' => 'appointments'
                                // ), */
                                array(
                                            'slug' => 'off_period',
                                            'title' => 'Période de fermeture',
                                            'description' => 'Plage de date pour une période de fermeture des livraison Format: MM-JJ|MM-JJ *NOT WORKING*',
                                            '`default`' => '12-24|12-25',
                                            '`value`' => '',
                                            'type' => 'text',
                                            '`options`' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'appointments'
                                ),
                                array(
                                            'slug' => 'min_appointment_amount',
                                            'title' => 'Montant minimum',
                                            'description' => 'Montant minimum pour accepter un achat',
                                            '`default`' => '0',
                                            '`value`' => '',
                                            'type' => 'text',
                                            '`options`' => '',
                                            'is_required' => 0,
                                            'is_gui' => 1,
                                            'module' => 'appointments'
                                ) 
                );

                // email templates
                $email_templates = array(
                                            array(
                                            'slug' => 'appointments-admin',
                                            'name' => 'Appointments admin',
                                            'description' => 'Email admin suite a prise de RDV',
                                            'subject' => 'RDV le {{ helper:date format="%A %e %b %Y" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }} - Patient: {{user_data:display_name}}',
                                            'body' => '<p>Un nouveau RDV pour {{user_data:display_name}} | {{appointment_data:email}}</p>
                                                        <h2>Date de livraison {{ helper:date format="%A %e %b %Y" timestamp=appointment_data:appointment_date }}</h2>
                                                        <h3>Plage horaire souhaitée {{ appointment_data:appointment_time }}</h3>

                                                        <p> 
                                                        <a href="https://maps.google.fr/maps/search/{{appointment_data:street}}, {{appointment_data:area_name}} {{appointment_data:town}}" target="_blank">Voir sur Google</a><br />
                                                        Contact :<br />
                                                        <a href="tel:{{appointment_data:phone}}">{{appointment_data:phone}} </a> - <a href="tel:{{appointment_data:mobile}}">{{appointment_data:mobile}} </a> - <a href="mailto:{{appointment_data:email}}">{{appointment_data:email}} </a><br />
                                                        </p>    
                                                        <p>
                                                        N° RDV: {{appointment_id}} {{ admin_url }}<br />
                                                        <a href="{{url:site}}admin/appointments?searchBtn=Search&appointment_date={{appointment_data:appointment_date}}" target="_blank">
                                                        Voir les RDV du {{appointment_data:appointment_date}}
                                                        </a>
                                                        <br />
                                                        <a href="{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}" target="_blank">
                                                        Voir les commandes de {{user_data:display_name}}
                                                        </a>
                                                        <br />
                                                        RDV pris le {{ helper:date format="%d %b %Y à %H:%M:%S" timestamp=appointment_data:appointment_date }}
                                                        </p>
                                                        <p>
                                                        User ID: {{ appointment_data:user_id }}<br />
                                                        IP Address: {{ sender_ip }}<br />
                                                        Operating System: {{ sender_os }}<br />
                                                        User Agent: {{ sender_agent }}
                                                        </p>',
                                            'lang' => 'fr',
                                            'is_default' => 0,
                                            'module' => 'appointments'
                                    ),
                                            array(
                                            'slug' => 'appointments-patient',
                                            'name' => 'Appointment mail for patient',
                                            'description' => 'Email au patient suite à une prise de RDV par le patient',
                                            'subject' => 'Votre RDV du {{ helper:date format="%A %e %b %Y" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }}',
                                            'body' => '<p>Bonjour {{user_data:display_name}}
                                                    <br/>
                                                    Vous avez effectué une prise de RDV pour le {{ helper:date format="%A %e %b %Y à %R" timestamp=appointment_data:appointment_date }}
                                                    </p>

                                                    <h2>Date du RDV{{ helper:date format="%A %e %b %Y" timestamp=appointment_data:appointment_date }}</h2>
                                                    <h3>Heure du RDV {{ appointment_data:appointment_time }}</h3>
  
                                                    <p>
                                                    <a href="{{url:site}}appointments/view/{{appointment_id}}" target="_blank">Vous pouvez voir votre RDV içi</a><br />
                                                    <br />
                                                    Merci pour votre confiance.
                                                    </p>
                                                    <p> 
                                                    User ID: {{ appointment_data:user_id }}<br />
                                                    IP Address: {{ sender_ip }}<br />
                                                    Operating System: {{ sender_os }}<br />
                                                    User Agent: {{ sender_agent }}
                                            ',
                                            'lang' => 'fr',
                                            'is_default' => 0,
                                            'module' => 'appointments'
                                    ),
                                            array(
                                            'slug' => 'appointments-modified-admin',
                                            'name' => 'Appointments modified admin ',
                                            'description' => 'Email envoyé à l\'admin après modification d\'un RDV',
                                            'subject' => '{{ helper:date format="%A %e %b %Y" timestamp=appointment_data:appointment_date }} - Modification par {{user_data:display_name}}',
                                            'body' => '<h2>Le RDV de {{user_data:display_name}}</h2>
                                                        <h3>Date du RDV: {{ helper:date format="%A %e %b %Y" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }}  </h3> 
                                                        <p>
                                                        Adresse:<br /> 
                                                        {{appointment_data:address}}, {{appointment_data:area_name}} {{appointment_data:town}}<br />
                                                        <a href="https://maps.google.fr/maps/search/{{appointment_data:address}}, {{appointment_data:area_name}} {{appointment_data:town}}" target="_blank">Voir sur Google</a><br />
                                                        Contact :<br />
                                                        <a href="tel:{{appointment_data:phone}}">{{appointment_data:phone}} </a> - <a href="tel:{{appointment_data:mobile}}">{{appointment_data:mobile}} </a> - <a href="mailto:{{appointment_data:email}}">{{appointment_data:email}} </a><br />
                                                        </p>  
                                                        <p>
                                                        Message du client<br />
                                                        {{appointment_data:message}}
                                                        </p> 
                                                        <p>
                                                        User ID: {{ appointment_data:user_id }}<br />
                                                        IP Address: {{ sender_ip }}<br />
                                                        Operating System: {{ sender_os }}<br />
                                                        User Agent: {{ sender_agent }}<br />
                                                        </p>
                                            ',
                                            'lang' => 'fr',
                                            'is_default' => 0,
                                            'module' => 'appointments'
                                    ),
                                            array(
                                            'slug' => 'appointments-deleted-admin',
                                            'name' => 'Appointments deleted admin',
                                            'description' => 'Email envoyé à l\'admin après annulation d\'un RDV',
                                            'subject' => '{{ helper:date format="%A %e %b %Y" timestamp=appointment_data:appointment_date }} à {{ appointment_data:appointment_time }} - Annulation de {{user_data:display_name}} ',
                                            'body' => '<h2>Le RDV de {{user_data:display_name}} | {{appointment_data:email}} a été annulé!</h2>
                                                    <h3>Date de RDV: {{ helper:date format="%A %e %b %Y" timestamp=appointment_data:appointment_date }} </h3> 
                                                    <p> 
                                                    N° RDV: {{appointment_id}} - {{ admin_url }}<br />
                                                    <a href="{{url:site}}admin/appointments?searchBtn=Search&appointment_date={{appointment_data:appointment_date}}" target="_blank">
                                                    Voir les RDV du {{appointment_data:appointment_date}}
                                                    </a>
                                                    <br />
                                                    <a href="{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}" target="_blank">
                                                    Voir les RDV {{user_data:display_name}}
                                                    </a>
                                                    <br />
                                                    RDV pris le {{ helper:date format="%d %b %Y à %H:%M:%S" timestamp={appointment_data:appointment_date} }}
                                                    </p> 
                                                    <p> 
                                                    User ID: {{ appointment_data:user_id }}<br />
                                                    IP Address: {{ sender_ip }}<br />
                                                    Operating System: {{ sender_os }}<br />
                                                    User Agent: {{ sender_agent }}<br />
                                                    </p> ',
                                            'lang' => 'fr',
                                            'is_default' => 0,
                                            'module' => 'appointments'
                                    )
                ); 
		
                //remove previous install
		$this->dbforge->drop_table('appointments_list');
		$this->dbforge->drop_table('appointments_details');
		$this->db->delete('settings', array('module' => 'appointments')); 
		
                //now isntall
                //tables
		if (
                        ! $this->install_tables( array('appointments_list' => $appointments_list, 'appointments_details' => $appointments_details) )
		    )
		{
			return  false;
		}
		
                //settings
		foreach ($appointments_settings as $setting)
		{
			if ( ! $this->db->insert('settings', $setting))
			{
				return false;
			}
                }
                
                // email templates 
                foreach ($email_templates as $email)
                {
                        if ( ! $this->db->insert('email_templates', $email))
                        {
                                return false;
                        }
                }
                
                //upload dir
		if( is_dir($this->upload_path.'appointments') OR @mkdir($this->upload_path.'appointments',0777,TRUE))
		{
			return TRUE;
		}
                
                return false;
	}

	public function uninstall()
	{
		$this->dbforge->drop_table('appointments_list');
		$this->dbforge->drop_table('appointments_details');
		$this->db->delete('settings', array('module' => 'appointments')); 
		$this->db->delete('email_templates', array('module' => 'appointments')); 
			return TRUE; 
	}


	public function upgrade($old_version)
	{
		//$this->db->delete('settings', array('module' => 'appointments'));
                        $appointments_settings = array(
                            
//                                array(
//                                            'slug' => 'seller_email',
//                                            'title' => 'Adresse email',
//                                            'description' => 'Adresse email de l\'expediteur pour l\'envoi des emails, adresse de destinataire des message systèmes. Mails séparés par virgule.',
//                                            '`default`' => '',
//                                            '`value`' => '',
//                                            'type' => 'text',
//                                            '`options`' => '',
//                                            'is_required' => 1,
//                                            'is_gui' => 1,
//                                            'module' => 'appointments'
//                                ),
                        );
                // Your Upgrade Logic
                // emails insertion
                if(version_compare($this->version, '0.0.07', '<=') ) 
                {
                        // email templates
                        $email_templates = array();
                        foreach ($email_templates as $email)
                        {
                                if ( ! $this->db->insert('email_templates', $email))
                                {
                                        return false;
                                }
                        }

                }
            
                if(version_compare($this->version, '0.0.01', '<=') ) 
                {
                            $fields = array(
                            'appointment_time' => array(
                                            'type' => 'VARCHAR',
                                            'constraint' => '120',
                                            'null' => TRUE
                                            ),
                            );

                            $this->dbforge->modify_column('appointments_list', $fields);

                }
 		
		foreach ($appointments_settings as $setting)
		{
			if ( ! $this->db->insert('settings', $setting))
			{
				return false;
			}
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
/* End of file details.php */
