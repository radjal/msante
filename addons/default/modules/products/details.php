<?php defined('BASEPATH') or exit('No direct script access allowed');

class Module_Products extends Module {

	public $version = '0.61.01';

	public function info()
	{
		return array(
			'name' => array(
				'en' => 'Products',
				'fr' => 'Produits',
			),
			'description' => array(
				'en' => 'Products module.',
				'fr' => 'Produits'
			),
			'frontend' => TRUE,
			'backend' => TRUE,
			'menu' => 'content', // You can also place modules in their top level menu. For example try: 'menu' => 'Products',
			'sections' => array(
				'items' => array(
					'name' 	=> 'products:items', // These are translated from your language file
					'uri' 	=> 'admin/products',
						'shortcuts' => array(
							'create' => array(
								'name' 	=> 'products:create',
								'uri' 	=> 'admin/products/create',
								'class' => 'add'
								)
							)
						),
                                    'categories' => array(
					'name' => 'products:categories_title',
					'uri' => 'admin/products/categories',
					'shortcuts' => array(
						array(
							'name' => 'products:create_categories',
							'uri' => 'admin/products/categories/create',
							'class' => 'add',
						),
					),
				),
				)
		);
	}

	public function install()
	{
		$this->dbforge->drop_table('products');
		$this->dbforge->drop_table('products_categories');
		$this->dbforge->drop_table('products_assign_cat');
		$this->db->delete('settings', array('module' => 'products'));

		$products = array(
                                                 'id' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'auto_increment' => TRUE
                                                            ),
						'name' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '100'
                                                            ),
						'slug' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '100',
                                                            'unique' => true
                                                            ),
						'active' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '1',
                                                            'default' => '0',
                                                            ),
						'cat_id' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '80',
                                                            'default' => '0',
                                                            ),
						'parent_cid' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'default' => '0',
                                                            ),
						'unit' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '100',
                                                            'default' => 'kg',
                                                            ),
						'stock' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '6',
                                                            'default' => '0',
                                                            ),
						'price' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '8',
                                                            'default' => '0',
                                                            ),
						'tax' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '5',
                                                            'default' => '0',
                                                            ),
						'final_price' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '9',
                                                            'default' => '0',
                                                            ),										
						'origin' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '120',
                                                            'default' => '',
                                                            ),
						'description' => array(
                                                            'type' => 'TEXT',
                                                            ),
						'image_filename' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '120',
                                                            'default' => '',
                                                            ),
						'start_date' => array(
                                                            'type'       => 'date',
                                                            'default'    => '1970-01-01',
                                                            'null' => TRUE
                                                            ),
						'end_date' => array(
                                                            'type'       => 'date',
                                                            'default'    => '1970-01-01',
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

		$product_categories = array(
                                                'id' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'auto_increment' => TRUE
                                                            ),
						'parent_id' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'default'    => 0,
                                                            ),
						'name' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '100'
                                                            ),
						'slug' => array(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '100'
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

		$products_assign_cat = array(
                                                'id' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'auto_increment' => TRUE
                                                            ),
						'product_id' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'default'    => 0,
                                                            ),
						'category_id' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'default'    => 0,
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
                
                $tables_created = false;
                $this->dbforge->add_field($products);
                $this->dbforge->add_key('id', TRUE);
                if($this->dbforge->create_table('products')) $tables_created = true;
                
                $this->dbforge->add_field($product_categories);
                $this->dbforge->add_key('id', TRUE);
                if($this->dbforge->create_table('products_categories'))  $tables_created = true;
                
                $this->dbforge->add_field($products_assign_cat);
                $this->dbforge->add_key('id', TRUE);
                if($this->dbforge->create_table('products_assign_cat'))  $tables_created = true;
                
		if($tables_created AND
		   /* $this->db->insert('settings', $products_setting) AND */
		   is_dir($this->upload_path.'products') OR @mkdir($this->upload_path.'products',0777,TRUE))
		{
			return TRUE;
		}
	}

	public function uninstall()
	{
		$this->dbforge->drop_table('products');
		$this->dbforge->drop_table('products_categories');
		$this->dbforge->drop_table('products_assign_cat');
		$this->db->delete('settings', array('module' => 'products'));
		{
			return TRUE;
		}
	}


	public function upgrade($old_version)
	{
		// Your Upgrade Logic
            
            if(version_compare($this->version, '0.55', '<=') ) 
            {
                        $fields = array(
                                    'cat_id' => array(
                                                        // 'name' => 'new_name',(
                                                            'type' => 'VARCHAR',
                                                            'constraint' => '80',
                                                            'default' => '0',
                                                            ),
                        );
                        
                        $this->dbforge->modify_column('products', $fields);
                
            }
            if(version_compare($this->version, '0.60.1', '<=') ) 
            {
		$products_assign_cat = array(
                                                'id' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'auto_increment' => TRUE
                                                            ),
						'product_id' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'default'    => 0,
                                                            ),
						'category_id' => array(
                                                            'type' => 'INT',
                                                            'constraint' => '11',
                                                            'default'    => 0,
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
                $this->dbforge->add_field($products_assign_cat);
                $this->dbforge->add_key('id', TRUE);
                if($this->dbforge->create_table('products_assign_cat'))  return true;
            }       
		
            return TRUE;
	}

	public function help()
	{
		// Return a string containing help info
		// You could include a file and return it here.
		return "No documentation has been added for this module.<br />Contact the module developer for assistance.";
	}
}
/* End of file details.php */
