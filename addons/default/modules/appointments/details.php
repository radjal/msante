<?php defined('BASEPATH') or exit('No direct script access allowed');

class Module_Appointments extends Module {

	public $version = '0.1.0';

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
                                    'list' => array(
					'name' => 'appointments:list_title',
					'uri' => 'admin/appointments/list',
					),
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
						'name' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '100'
                                                            ),
						'slug' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '100'
                                                            ),
						'appointment_status' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '100',
                                                            'default' => '',
                                                            ),
						'appointment_date' => array(
                                                            'type'       => 'datetime',
                                                            'default'    => '1970-01-01 00:00:01',
                                                            'null' => TRUE
                                                            ),
/* 						// 'delivery_date' => array(
                                                            // 'type'       => 'date',
                                                            // 'default'    => '1970-01-01',
                                                            // 'null' => TRUE
                                                            // ), */
						'appointment_time' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '120',
                                                            'null' => TRUE
                                                            ),
						'message' => array(
                                                            'type' => 'TEXT',
                                                            'null' => TRUE
                                                            ),
						/* // 'log' => array(
                                                            // 'type' => 'TEXT',
                                                            // 'null' => TRUE
                                                            // ),
						// 'i_company' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '120',
                                                            // 'default' => '',
                                                            // ),				 */		
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
			/* 			// 'i_street2' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '250',
                                                            // 'default' => '',
                                                            // ), */
						'town' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '120',
                                                            'default' => '',
                                                            ),
						'area_name' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '10',
                                                            'default' => '',
                                                            ),
				/* 		// 'i_region' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '10',
                                                            // 'default' => '',
                                                            // ),
						// 'i_country' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '10',
                                                            // 'default' => '',
                                                            // ), */
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
				/*		// 'discount' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '5',
                                                            // 'default' => 0,
                                                            // ),	
						// 'd_company' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '120',
                                                            // 'default' => '',
                                                            // ),	
						// 'd_fullname' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '120',
                                                            // 'default' => '',
                                                            // ),
						// 'd_firstname' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '60',
                                                            // 'default' => '',
                                                            // ),								
						// 'd_lastname' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '60',
                                                            // 'default' => '',
                                                            // ),								
						// 'd_civility' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '10',
                                                            // 'default' => '',
                                                            // ),		
                                                // 'd_phone' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '20',
                                                            // 'default' => '',
                                                            // ),
						// 'd_mobile' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '20',
                                                            // 'default' => '',
                                                            // ),
						// 'd_mail' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '80',
                                                            // 'default' => '',
                                                            // ),
						// 'd_street1' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '250',
                                                            // 'default' => '',
                                                            // ),
						// 'd_street2' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '250',
                                                            // 'default' => '',
                                                            // ),
						// 'd_town' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '120',
                                                            // 'default' => '',
                                                            // ),
						// 'd_zipcode' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '10',
                                                            // 'default' => '',
                                                            // ),
						// 'd_region' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '10',
                                                            // 'default' => '',
                                                            // ),
						// 'd_country' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '10',
                                                            // 'default' => '',
                                                            // ),
                                                        // 'ip' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '255',
                                                            // 'null' => TRUE
                                                            // ),
                                                // 'user_agent' => array(
                                                            // 'type' => 'VARCHAR',
                                                            // 'constraint' => '255',
                                                            // 'null' => TRUE
                                                            // ), */
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
						/*// 'product_qty' => array(
                                                                // 'type' => 'VARCHAR',
                                                                // 'constraint' => '11',
                                                                // ),
						// 'unit_price' => array(
                                                                // 'type' => 'VARCHAR',
                                                                // 'constraint' => '11',
                                                                // ),
						// 'line_price' => array(
                                                                // 'type' => 'VARCHAR',
                                                                // 'constraint' => '11',
                                                                // ),
						// 'tax' => array(
                                                                // 'type' => 'VARCHAR',
                                                                // 'constraint' => '3',
                                                                // ),
						// 'final_price' => array(
                                                                // 'type' => 'VARCHAR',
                                                                // 'constraint' => '11',
                                                                // ),
                                                    // 'name' => array(
                                                                // 'type' => 'VARCHAR',
                                                                // 'constraint' => '100',
                                                                // ),
                                                    // 'slug' => array(
                                                                // 'type' => 'VARCHAR',
                                                                // 'constraint' => '100'
                                                                // ),
                                                    // 'unit' => array(
                                                                // 'type' => 'VARCHAR',
                                                                // 'constraint' => '20',
                                                                // 'default' => '',
                                                                // ),
                                                    // 'origin' => array(
                                                                // 'type' => 'VARCHAR',
                                                                // 'constraint' => '100',
                                                                // 'default' => '',
                                                                // ),
                                                    // 'comment' => array(
                                                                // 'type' => 'VARCHAR',
                                                                // 'constraint' => '120',
                                                                // 'default' => '',
                                                                // ),
                                                // 'image_filename' => array(
                                                                // 'type' => 'VARCHAR',
                                                                // 'constraint' => '120',
                                                                // 'default' => '',
                                                                // ), */
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
                                ),
                                /*// array(
                                            // 'slug' => 'paypal_access_token',
                                            // 'title' => 'Token PayPal',
                                            // 'description' => 'Token d\'accès PayPal?',
                                            // '`default`' => '',
                                            // '`value`' => '',
                                            // 'type' => 'text',
                                            // '`options`' => '',
                                            // 'is_required' => 0,
                                            // 'is_gui' => 1,
                                            // 'module' => 'appointments'
                                // ),
                                // array(
                                            // 'slug' => 'paypal_commercial_name',
                                            // 'title' => 'Nom PayPal',
                                            // 'description' => 'Nom de commercant PayPal?',
                                            // '`default`' => '',
                                            // '`value`' => '',
                                            // 'type' => 'text',
                                            // '`options`' => '',
                                            // 'is_required' => 0,
                                            // 'is_gui' => 1,
                                            // 'module' => 'appointments'
                                // ),
                                // array(
                                            // 'slug' => 'manage_stock',
                                            // 'title' => 'Gestion du stock',
                                            // 'description' => 'Gérer le stock?',
                                            // '`default`' => '1',
                                            // '`value`' => '1',
                                            // 'type' => 'select',
                                            // '`options`' => '1=Oui|0=Non',
                                            // 'is_required' => 1,
                                            // 'is_gui' => 1,
                                            // 'module' => 'appointments'
                                // ),
                                array(
                                            'slug' => 'delivery_days',
                                            'title' => 'Jours de livraison',
                                            'description' => 'Les jours de livraison',
                                            'default' => '1',
                                            'value' => '1',
                                            'type' => 'checkbox',
                                            '`options`' => '1=Lundi|2=Mardi|3=Mercredi|4=Jeudi|5=Vendredi|6=Samedi|0=Dimanche',
                                            'is_required' => 1,
                                            'is_gui' => 1,
                                            'module' => 'appointments'
                                ),
                                // array(
                                // 'slug' => 'hours_weekday1',
                                            // 'title' => 'Heures de livraison le lundi',
                                            // 'description' => '',
                                            // 'type' => 'text',
                                            // 'default' => '',
                                            // 'value' => '',
                                            // 'options' => '',
                                            // 'is_required' => 0,
                                            // 'is_gui' => 1,
                                            // 'module' => 'appointments',
                                // ),
                                // array(
                                // 'slug' => 'hours_weekday2',
                                            // 'title' => 'Heures de livraison le mardi',
                                            // 'description' => '',
                                            // 'type' => 'text',
                                            // 'default' => '',
                                            // 'value' => '',
                                            // 'options' => '',
                                            // 'is_required' => 0,
                                            // 'is_gui' => 1,
                                            // 'module' => 'appointments',
                                // ),
                                // array(
                                // 'slug' => 'hours_weekday3',
                                            // 'title' => 'Heures de livraison le mercredi',
                                            // 'description' => '',
                                            // 'type' => 'text',
                                            // 'default' => '',
                                            // 'value' => '',
                                            // 'options' => '',
                                            // 'is_required' => 0,
                                            // 'is_gui' => 1,
                                            // 'module' => 'appointments',
                                // ),
                                // array(
                                // 'slug' => 'hours_weekday4',
                                            // 'title' => 'Heures de livraison le jeudi',
                                            // 'description' => '',
                                            // 'type' => 'text',
                                            // 'default' => '',
                                            // 'value' => '',
                                            // 'options' => '',
                                            // 'is_required' => 0,
                                            // 'is_gui' => 1,
                                            // 'module' => 'appointments',
                                // ),
                                // array(
                                // 'slug' => 'hours_weekday5',
                                            // 'title' => 'Heures de livraison le vendredi',
                                            // 'description' => '',
                                            // 'type' => 'text',
                                            // 'default' => '',
                                            // 'value' => '',
                                            // 'options' => '',
                                            // 'is_required' => 0,
                                            // 'is_gui' => 1,
                                            // 'module' => 'appointments',
                                // ),
                                // array(
                                // 'slug' => 'hours_weekday6',
                                            // 'title' => 'Heures de livraison le samedi',
                                            // 'description' => '',
                                            // 'type' => 'text',
                                            // 'default' => '',
                                            // 'value' => '',
                                            // 'options' => '',
                                            // 'is_required' => 0,
                                            // 'is_gui' => 1,
                                            // 'module' => 'appointments',
                                // ),
                                // array(
                                // 'slug' => 'hours_weekday0',
                                            // 'title' => 'Heures de livraison le dimanche',
                                            // 'description' => '',
                                            // 'type' => 'text',
                                            // 'default' => '',
                                            // 'value' => '',
                                            // 'options' => '',
                                            // 'is_required' => 0,
                                            // 'is_gui' => 1,
                                            // 'module' => 'appointments',
                                // )    */
                );

                // email templates
                $email_templates = array(
                                            array(
                                            'slug' => 'appointments-admin',
                                            'name' => 'Appointments admin',
                                            'description' => 'Email admin suite a une commande',
                                            'subject' => '{{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }} - Commande de {{user_data:display_name}} - {{appointment_data:total_final}}€',
                                            'body' => '<p>Une nouvelle commande de {{user_data:display_name}} | {{appointment_data:d_mail}}</p>
                                                        <h2>Date de livraison {{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }}</h2>
                                                        <h3>Plage horaire souhaitée {{ appointment_data:appointment_time }}</h3>

                                                        <p>
                                                        Adresse:<br />
                                                        {{appointment_data:d_company}}, {{appointment_data:d_fullname}}<br />
                                                        {{appointment_data:d_street1}}, {{appointment_data:d_zipcode}} {{appointment_data:d_town}}<br />
                                                        <a href="https://maps.google.fr/maps/search/{{appointment_data:d_street1}}, {{appointment_data:d_zipcode}} {{appointment_data:d_town}}" target="_blank">Voir sur Google</a><br />
                                                        Contact :<br />
                                                        <a href="tel:{{appointment_data:d_phone}}">{{appointment_data:d_phone}} </a> - <a href="tel:{{appointment_data:d_mobile}}">{{appointment_data:d_mobile}} </a> - <a href="mailto:{{appointment_data:d_mail}}">{{appointment_data:d_mail}} </a><br />
                                                        </p>
                                                        <p>
                                                        TOTAL : {{appointment_data:total_final}}€<br />
                                                        Type de paiement : {{appointment_data:payment_type}}<br />
                                                        </p>
                                                        <p>
                                                        Commande:<br />
                                                        {{cart_data}}
                                                        {{ appointment_qty }} x {{ name }} <br />
                                                        {{/cart_data}}
                                                        </p>
                                                        <p>
                                                        Message du client<br />
                                                        {{appointment_data:message}}
                                                        </p>
                                                        <p>
                                                        N° commande: {{appointment_id}}-{{appointment_data:slug}} - {{ admin_url }}<br />
                                                        <a href="{{url:site}}admin/appointments?searchBtn=Search&delivery_date={{appointment_data:delivery_date}}" target="_blank">
                                                        Voir les commandes du {{appointment_data:delivery_date}}
                                                        </a>
                                                        <br />
                                                        <a href="{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}" target="_blank">
                                                        Voir les commandes de {{user_data:display_name}}
                                                        </a>
                                                        <br />
                                                        Commande passé le {{ helper:date format="%d %b %Y à %H:%M:%S" timestamp=appointment_data:appointment_date }}
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
                                            'slug' => 'appointments-client',
                                            'name' => 'Appointments client',
                                            'description' => 'Email suite à une commande client',
                                            'subject' => 'Votre commande de {{appointment_data:total_final}}€ chez {{settings:site_name}}',
                                            'body' => '<p>Bonjour {{user_data:display_name}}
                                                    <br/>
                                                    Vous avez effectué une commande sur notre site {{settings:site_name}} le {{ helper:date format="%A %e %b %Y à %R" timestamp=appointment_data:appointment_date }}
                                                    </p>

                                                    <h2>Date de livraison {{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }}</h2>
                                                    <h3>Plage horaire souhaitée {{ appointment_data:appointment_time }}</h3>

                                                    <p>Adresse:<br />
                                                    {{appointment_data:d_fullname}}<br />
                                                    {{appointment_data:d_company}} {{appointment_data:d_street1}}, {{appointment_data:d_zipcode}} {{appointment_data:d_town}}
                                                    </p>
                                                    <p>Commande:<br />
                                                    {{cart_data}} 
                                                        {{ appointment_qty }} x {{ name }}<br />
                                                    {{/cart_data}}
                                                    </p>
                                                    <p>
                                                    TOTAL : {{appointment_data:total_final}}&euro;<br />
                                                    Type de paiement : {{appointment_data:payment_type}}
                                                    </p>
                                                    <p>Si vous avez une question n\'hésitez pas à nous contacter par email <a href="mailto:{{variables:email}}">{{variables:email}}</a><br />
                                                    ou par téléphone <a href="mailto:{{variables:numero_tel}}">{{variables:numero_tel}}</a><br />
                                                    <br />
                                                    <a href="{{url:site}}appointments/view/{{appointment_id}}" target="_blank">Vous pouvez voir votre commande içi</a><br />
                                                    <br />
                                                    Merci pour votre confiance.
                                                    </p>
                                                    <p> N&deg; commande: {{appointment_id}}-{{appointment_data:slug}}<br />
                                                    <br />
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
                                            'description' => 'Email envoyé à l\'admin après modification d\'une commande',
                                            'subject' => '{{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }} - Modification par {{user_data:display_name}}',
                                            'body' => '<h2>La commande de {{user_data:display_name}} | {{appointment_data:d_mail}} a été modifé!</h2>
                                                        <h3>Date de livraison: {{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }} </h3>
                                                        <h3>Plage horaire souhaitée: {{ appointment_data:appointment_time }} </h3>

                                                        <p>
                                                        Adresse:<br />
                                                        {{appointment_data:d_company}}, {{appointment_data:d_fullname}}<br />
                                                        {{appointment_data:d_street1}}, {{appointment_data:d_zipcode}} {{appointment_data:d_town}}<br />
                                                        <a href="https://maps.google.fr/maps/search/{{appointment_data:d_street1}}, {{appointment_data:d_zipcode}} {{appointment_data:d_town}}" target="_blank">Voir sur Google</a><br />
                                                        Contact :<br />
                                                        <a href="tel:{{appointment_data:d_phone}}">{{appointment_data:d_phone}} </a> - <a href="tel:{{appointment_data:d_mobile}}">{{appointment_data:d_mobile}} </a> - <a href="mailto:{{appointment_data:d_mail}}">{{appointment_data:d_mail}} </a><br />
                                                        </p>
                                                        <p>
                                                        TOTAL : {{appointment_data:total_final}}€<br />
                                                        Type de paiement : {{appointment_data:payment_type}}<br />
                                                        </p>
                                                        <p>
                                                        Commande:<br />
                                                        {{cart_data }}
                                                        {{ appointment_qty }} x {{ name }}<br />
                                                        {{/cart_data }}
                                                        </p>
                                                        <p>
                                                        Message du client<br />
                                                        {{appointment_data:message}}
                                                        </p>
                                                        <p>
                                                        N° commande: {{appointment_id}}-{{appointment_data:slug}} - {{ admin_url }}<br />
                                                        <a href="{{url:site}}admin/appointments?searchBtn=Search&delivery_date={{appointment_data:delivery_date}}" target="_blank">
                                                        Voir les commandes du {{appointment_data:delivery_date}}
                                                        </a>
                                                        <br />
                                                        <a href="{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}" target="_blank">
                                                        Voir les commandes de {{user_data:display_name}}
                                                        </a>
                                                        <br />
                                                        Commande passé le {{ helper:date format="%d %b %Y à %H:%M:%S" timestamp={appointment_data:appointment_date} }}
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
                                            'description' => 'Email envoyé à l\'admin après annulation d\'une commande',
                                            'subject' => '{{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }} - Annulation de {{user_data:display_name}} ',
                                            'body' => '<h2>La commande de {{user_data:display_name}} | {{appointment_data:d_mail}} a été annulé!</h2>
                                                    <h3>Date de livraison: {{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }} </h3>
                                                    <p> 
                                                    TOTAL : {{appointment_data:total_final}}€<br />
                                                    Type de paiement : {{appointment_data:payment_type}}
                                                    </p>
                                                    <p> 
                                                    N° commande: {{appointment_id}}-{{appointment_data:slug}} - {{ admin_url }}<br />
                                                    <a href="{{url:site}}admin/appointments?searchBtn=Search&delivery_date={{appointment_data:delivery_date}}" target="_blank">
                                                    Voir les commandes du {{appointment_data:delivery_date}}
                                                    </a>
                                                    <br />
                                                    <a href="{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}" target="_blank">
                                                    Voir les commandes de {{user_data:display_name}}
                                                    </a>
                                                    <br />
                                                    Commande passé le {{ helper:date format="%d %b %Y à %H:%M:%S" timestamp={appointment_data:appointment_date} }}
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
                
		//return true;
		
		$this->dbforge->drop_table('appointments_list');
		$this->dbforge->drop_table('appointments_details');
		$this->db->delete('settings', array('module' => 'appointments'));
		$tables = true; 
		
		if (
                        ! $this->install_tables( array('appointments_list' => $appointments_list, 'appointments_details' => $appointments_details) )
		    )
		{
			return  false;
		}
		
		foreach ($appointments_settings as $setting)
		{
			if ( ! $this->db->insert('settings', $setting))
			{
				return false;
			}
                }
                
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
		{
			return TRUE;
		}
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
                        $email_templates = array(
                                            array(
                                            'slug' => 'appointments-admin',
                                            'name' => 'Appointments admin',
                                            'description' => 'Email admin suite a une commande',
                                            'subject' => '{{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }} - Commande de {{user_data:display_name}} - {{appointment_data:total_final}}€',
                                            'body' => '<p>Une nouvelle commande de {{user_data:display_name}} | {{appointment_data:d_mail}}</p>
                                                        <h2>Date de livraison {{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }}</h2>
                                                        <h3>Plage horaire souhaitée {{ appointment_data:appointment_time }}</h3>

                                                        <p>
                                                        Adresse:<br />
                                                        {{appointment_data:d_company}}, {{appointment_data:d_fullname}}<br />
                                                        {{appointment_data:d_street1}}, {{appointment_data:d_zipcode}} {{appointment_data:d_town}}<br />
                                                        <a href="https://maps.google.fr/maps/search/{{appointment_data:d_street1}}, {{appointment_data:d_zipcode}} {{appointment_data:d_town}}" target="_blank">Voir sur Google</a><br />
                                                        Contact :<br />
                                                        <a href="tel:{{appointment_data:d_phone}}">{{appointment_data:d_phone}} </a> - <a href="tel:{{appointment_data:d_mobile}}">{{appointment_data:d_mobile}} </a> - <a href="mailto:{{appointment_data:d_mail}}">{{appointment_data:d_mail}} </a><br />
                                                        </p>
                                                        <p>
                                                        TOTAL : {{appointment_data:total_final}}€<br />
                                                        Type de paiement : {{appointment_data:payment_type}}<br />
                                                        </p>
                                                        <p>
                                                        Commande:<br />
                                                        {{cart_data}}
                                                        {{ appointment_qty }} x {{ name }} <br />
                                                        {{/cart_data}}
                                                        </p>
                                                        <p>
                                                        Message du client<br />
                                                        {{appointment_data:message}}
                                                        </p>
                                                        <p>
                                                        N° commande: {{appointment_id}}-{{appointment_data:slug}} - {{ admin_url }}<br />
                                                        <a href="{{url:site}}admin/appointments?searchBtn=Search&delivery_date={{appointment_data:delivery_date}}" target="_blank">
                                                        Voir les commandes du {{appointment_data:delivery_date}}
                                                        </a>
                                                        <br />
                                                        <a href="{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}" target="_blank">
                                                        Voir les commandes de {{user_data:display_name}}
                                                        </a>
                                                        <br />
                                                        Commande passé le {{ helper:date format="%d %b %Y à %H:%M:%S" timestamp=appointment_data:appointment_date }}
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
                                            'slug' => 'appointments-client',
                                            'name' => 'Appointments client',
                                            'description' => 'Email suite à une commande client',
                                            'subject' => 'Votre commande de {{appointment_data:total_final}}€ chez {{settings:site_name}}',
                                            'body' => '<p>Bonjour {{user_data:display_name}}
                                                    <br/>
                                                    Vous avez effectué une commande sur notre site {{settings:site_name}} le {{ helper:date format="%A %e %b %Y à %R" timestamp=appointment_data:appointment_date }}
                                                    </p>

                                                    <h2>Date de livraison {{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }}</h2>
                                                    <h3>Plage horaire souhaitée {{ appointment_data:appointment_time }}</h3>

                                                    <p>Adresse:<br />
                                                    {{appointment_data:d_fullname}}<br />
                                                    {{appointment_data:d_company}} {{appointment_data:d_street1}}, {{appointment_data:d_zipcode}} {{appointment_data:d_town}}
                                                    </p>
                                                    <p>Commande:<br />
                                                    {{cart_data}} 
                                                        {{ appointment_qty }} x {{ name }}<br />
                                                    {{/cart_data}}
                                                    </p>
                                                    <p>
                                                    TOTAL : {{appointment_data:total_final}}&euro;<br />
                                                    Type de paiement : {{appointment_data:payment_type}}
                                                    </p>
                                                    <p>Si vous avez une question n\'hésitez pas à nous contacter par email <a href="mailto:{{variables:email}}">{{variables:email}}</a><br />
                                                    ou par téléphone <a href="mailto:{{variables:numero_tel}}">{{variables:numero_tel}}</a><br />
                                                    <br />
                                                    <a href="{{url:site}}appointments/view/{{appointment_id}}" target="_blank">Vous pouvez voir votre commande içi</a><br />
                                                    <br />
                                                    Merci pour votre confiance.
                                                    </p>
                                                    <p> N&deg; commande: {{appointment_id}}-{{appointment_data:slug}}<br />
                                                    <br />
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
                                            'description' => 'Email envoyé à l\'admin après modification d\'une commande',
                                            'subject' => '{{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }} - Modification par {{user_data:display_name}}',
                                            'body' => '<h2>La commande de {{user_data:display_name}} | {{appointment_data:d_mail}} a été modifé!</h2>
                                                        <h3>Date de livraison: {{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }} </h3>
                                                        <h3>Plage horaire souhaitée: {{ appointment_data:appointment_time }} </h3>

                                                        <p>
                                                        Adresse:<br />
                                                        {{appointment_data:d_company}}, {{appointment_data:d_fullname}}<br />
                                                        {{appointment_data:d_street1}}, {{appointment_data:d_zipcode}} {{appointment_data:d_town}}<br />
                                                        <a href="https://maps.google.fr/maps/search/{{appointment_data:d_street1}}, {{appointment_data:d_zipcode}} {{appointment_data:d_town}}" target="_blank">Voir sur Google</a><br />
                                                        Contact :<br />
                                                        <a href="tel:{{appointment_data:d_phone}}">{{appointment_data:d_phone}} </a> - <a href="tel:{{appointment_data:d_mobile}}">{{appointment_data:d_mobile}} </a> - <a href="mailto:{{appointment_data:d_mail}}">{{appointment_data:d_mail}} </a><br />
                                                        </p>
                                                        <p>
                                                        TOTAL : {{appointment_data:total_final}}€<br />
                                                        Type de paiement : {{appointment_data:payment_type}}<br />
                                                        </p>
                                                        <p>
                                                        Commande:<br />
                                                        {{cart_data }}
                                                        {{ appointment_qty }} x {{ name }}<br />
                                                        {{/cart_data }}
                                                        </p>
                                                        <p>
                                                        Message du client<br />
                                                        {{appointment_data:message}}
                                                        </p>
                                                        <p>
                                                        N° commande: {{appointment_id}}-{{appointment_data:slug}} - {{ admin_url }}<br />
                                                        <a href="{{url:site}}admin/appointments?searchBtn=Search&delivery_date={{appointment_data:delivery_date}}" target="_blank">
                                                        Voir les commandes du {{appointment_data:delivery_date}}
                                                        </a>
                                                        <br />
                                                        <a href="{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}" target="_blank">
                                                        Voir les commandes de {{user_data:display_name}}
                                                        </a>
                                                        <br />
                                                        Commande passé le {{ helper:date format="%d %b %Y à %H:%M:%S" timestamp={appointment_data:appointment_date} }}
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
                                            'description' => 'Email envoyé à l\'admin après annulation d\'une commande',
                                            'subject' => '{{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }} - Annulation de {{user_data:display_name}} ',
                                            'body' => '<h2>La commande de {{user_data:display_name}} | {{appointment_data:d_mail}} a été annulé!</h2>
                                                    <h3>Date de livraison: {{ helper:date format="%A %e %b %Y" timestamp=appointment_data:delivery_date }} </h3>
                                                    <p> 
                                                    TOTAL : {{appointment_data:total_final}}€<br />
                                                    Type de paiement : {{appointment_data:payment_type}}
                                                    </p>
                                                    <p> 
                                                    N° commande: {{appointment_id}}-{{appointment_data:slug}} - {{ admin_url }}<br />
                                                    <a href="{{url:site}}admin/appointments?searchBtn=Search&delivery_date={{appointment_data:delivery_date}}" target="_blank">
                                                    Voir les commandes du {{appointment_data:delivery_date}}
                                                    </a>
                                                    <br />
                                                    <a href="{{url:site}}admin/appointments?searchBtn=Search&user_id={{appointment_data:user_id}}" target="_blank">
                                                    Voir les commandes de {{user_data:display_name}}
                                                    </a>
                                                    <br />
                                                    Commande passé le {{ helper:date format="%d %b %Y à %H:%M:%S" timestamp={appointment_data:appointment_date} }}
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
