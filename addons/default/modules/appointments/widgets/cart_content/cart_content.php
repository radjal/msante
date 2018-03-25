<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Widget_Cart_content extends Widgets
{
    // The widget title,  this is displayed in the admin interface
    public $title = array(
		'en' => 'Contenu panier',
		'fr' => 'Cart content',
        );
            
    //The widget description, this is also displayed in the admin interface.  Keep it brief.
    public $description = array(
		'en' => 'The cart list and submit button',
		'fr' => 'Contenu du panier et bouton de commande',
    );

    // The author's name
    public $author = 'Radja Lomas';

    // The authors website for the widget
    public $website = 'http://radja.fr/';

    //current version of your widget
    public $version = '0.8.0';
    
    public function run($options)
    {
                //$this->load->model('appointments_m');
                $p_cookie= $this->appointments_m->get_cookie_cart();
                
                $rid = $this->input->get('remove');
//                $cart = $this->appointments_m->get_cart($rid);
                $count = count($cart['products']);
                if($count > 0) 
                { 
                    $totals['total_price'] = $cart['total_price'] ;
                    $totals['total_taxed'] = $cart['total_taxed'] ;
                    
                } 
                else 
                { 
                    $totals = false;
                
                }
       
		return array(
			'test' => 'test',
			'cart' => $cart['products'],
			'count' => $count,
			'totals' => $totals,
		);
    }

}