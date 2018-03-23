<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Example Plugin
 *
 * Quick plugin to demonstrate how things work
 *
 * @author		PyroCMS Dev Team
 * @package		PyroCMS\Addon\Plugins
 * @copyright	Copyright (c) 2009 - 2010, PyroCMS
 */
class Plugin_Msante extends Plugin
{
	public $version = '1.0.0';

	public $name = array(
		'en'	=> 'Msante plugin'
	);

	public $description = array(
		'en'	=> 'Some Msante helpers'
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
					'en' => 'Msante plugins.'
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
	 * Hello
	 *
	 * Usage:
	 * {{ example:hello }}
	 *
	 * @return string
	 */
	function hello()
	{
		$name = $this->attribute('name', 'World');
		
		return 'Hello '.$name.'!';
	} 

	/**
	 * Doctor Categories image tag
	 *
	 * Usage:
	 * {{ msante:doc_cat_img cat="category_name" }}
	 *
	 * @return string
	 */
	function doc_cat_img()
	{
		$cat = $this->attribute('cat'); 
                if(!$cat)                    return;
                switch ( $cat ) 
                {
                    case "Médecins généralistes": 
                        $path = 'e6ef08347e274fc655f20c172baad122.jpg';
                        break; 
                    case "Ophtalmologue": 
                        $path = 'da81bbdd7f739e786f674638e29ba433.jpg';
                        break; 
                    case "ORL": 
                        $path = '29edb0b1c84e0ed4df17c82fe658d9d5.jpg';
                        break; 
                    case "Cardiologue": 
                        $path = 'f40501b53bd7d3e0f62c5086ea1ecc2b.jpg';
                        break; 
                    case "Spécialistes femme": 
                        $path = '41f6ec9ed1a988081b7e137dee039c0d.jpg';
                        break; 
                    case "Dentiste": 
                        $path = '1717f2a8194f53253de0df0c7f5f998c.jpg';
                        break; 
                    case "Radiologue": 
                        $path = 'c9c12e653b087854ac27bf50eac5a6cc.jpg';
                        break; 
                    case "Autres médecins": 
                        $path = 'e6ef08347e274fc655f20c172baad122.jpg';
                        break; 
                    case "Etablissements de santé": 
                        $path = '056d27356ff595697ce2352501d71633.jpg';
                        break; 
                    default:
                        $path = '8b37a2a2cbf9537714125a8f8476e63a.jpg';
                        break;
                }
		return '<img src="'.site_url()."files/large/$path".'" height="80" class="img-circle" />' ;
	} 
}

/* End of file example.php */