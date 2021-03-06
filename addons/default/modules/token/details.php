<?php defined('BASEPATH') or exit('No direct script access allowed');

class Module_Token extends Module {

	public $version = '0.5.01';

	public function info()
	{
		return array(
			'name' => array(
				'en' => 'Token module'
			),
			'description' => array(
				'en' => 'Token management'
			),
			'frontend' => TRUE,
			'backend' => TRUE,
			'menu' => 'content', // You can also place modules in their top level menu. For example try: 'menu' => 'Sample',
			'sections' => array(
				'items' => array(
					'name' 	=> 'token:items', // These are translated from your language file
					'uri' 	=> 'admin/token',
						'shortcuts' => array(
							'create' => array(
								'name' 	=> 'token:create',
								'uri' 	=> 'admin/token/create',
								'class' => 'add'
								),
							'kill' => array(
								'name' 	=> 'token:kill',
								'uri' 	=> 'admin/token/kill',
								'class' => ''
								),
							'expired' => array(
								'name' 	=> 'token:expired',
								'uri' 	=> 'admin/token/expired',
								'class' => ''
								),
							'cleanup' => array(
								'name' 	=> 'token:cleanup',
								'uri' 	=> 'admin/token/cleanup',
								'class' => ''
								)
							)
                                    
						)
				)
		);
	}

	public function install()
	{
		$this->dbforge->drop_table('tokens');
                
                $success = true ;                
		$tokens = array(
                        'id' => array( 'type' => 'INT', 'unsigned' => TRUE, 'constraint' => '11', 'auto_increment' => TRUE, 'primary' => true, 'unique' => true, ),
                        'token' => array( 'type' => 'VARCHAR', 'constraint' => '255', 'unique' => true ),
                        'user_id' => array( 'type' => 'INT', 'constraint' => '5', 'null' => TRUE ),
                        'ip' => array( 'type' => 'VARCHAR', 'constraint' => '255', 'null' => TRUE ),
                        'user_agent' => array( 'type' => 'VARCHAR', 'constraint' => '255', 'null' => TRUE ),
                        'counter' => array( 'type' => 'INT', 'constraint' => '5', 'null' => TRUE ),
                        'timestamp' => array( 'type'       => 'datetime', 'default'    => '1970-01-01 00:00:01', 'null' => TRUE ),
                        'expires' => array( 'type'       => 'datetime', 'default'    => NULL, 'null' => TRUE ),
                        'created_on' => array( 'type'       => 'datetime', 'default'    => '1970-01-01 00:00:01', 'null' => TRUE ),
                        'alive' => array( 'type' => 'INT', 'constraint' => '1', 'null' => TRUE ),
                    
                        'module' => array( 'type' => 'VARCHAR', 'constraint' => '20', 'null' => TRUE ),
                        );

		$token_setting = array(
			'slug' => 'token_setting',
			'title' => 'Tokens Setting',
			'description' => 'A Yes or No option for the token module',
			'`default`' => '1',
			'`value`' => '1',
			'type' => 'select',
			'`options`' => '1=Yes|0=No',
			'is_required' => 1,
			'is_gui' => 1,
			'module' => 'token'
		);
          
                
		$this->dbforge->add_field($tokens);
		$this->dbforge->add_key('id', TRUE);
                if ($this->dbforge->create_table('tokens') === false ) 
                {
                    $success = false ;
                }
                
		if( $success AND
		   $this->db->insert('settings', $token_setting))
		{
			return TRUE;
		}
	}

	public function uninstall()
	{
		$this->dbforge->drop_table('tokens');
		$this->db->delete('settings', array('module' => 'token'));
		{
			return TRUE;
		}
	}

	public function upgrade($old_version)
	{
		// Your Upgrade Logic
            $ret = true;
                if(version_compare($this->version, '0.1.37', '<=') ) 
                {
                        $fields = array(
                                'expires' => array( 'type'       => 'datetime', 'default'    => null, 'null' => TRUE ),
                                'timestamp' => array( 'type'       => 'datetime', 'default'    => null, 'null' => TRUE ),
                                'created_on' => array( 'type'       => 'datetime', 'default'    => null, 'null' => TRUE ),
                                );                        
                        // $this->dbforge->add_column('tokens', $fields);
                       $ret = $this->dbforge->modify_column('tokens', $fields);
                }
                
                if(version_compare($this->version, '0.2.01', '<=') ) 
                {
                        $fields = array(
                                'module' => array( 'type' => 'VARCHAR', 'constraint' => '20', 'null' => TRUE ),
                                );                        
                        // $this->dbforge->add_column('tokens', $fields);
                       $ret = $this->dbforge->add_column('tokens', $fields);
                }
                
		return $ret ;
	}

	public function help()
	{
		// Return a string containing help info
		// You could include a file and return it here.
		return "No documentation has been added for this module.<br />Contact the module developer for assistance.";
	}
}
/* End of file details.php */
