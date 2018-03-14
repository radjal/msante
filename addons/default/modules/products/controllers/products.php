<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a products module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Products Module
 */
class Products extends Public_Controller
{
	public function __construct()
	{
		parent::__construct();

		// Load the required classes
		$this->load->model('products_m');
		$this->load->model('products_categories_m');
		$this->load->model('html_m');
		$this->lang->load('products');

		$this->template
			->append_css('module::products.css')
			->append_js('module::products.js');
	}
        
	public function category($catslug)
        {
            // call index with cat slug
            $offset = $this->uri->segment(4);
            $this->index($offset, $catslug);
        }

	/**
	 * All products
	 */
	public function index($offset=0, $cats_slugs=false)
	{
		// set the pagination limit
		$limit = 10;
                $offset = $offset > 1 ? $offset -1 : $offset;
                $offset = $offset * $limit;
                $pag_segment = 2;
                $pag_uri = "products";
                $search = false;
                $cat_slugids = false;
                /** categories */
                $cat_no = "";
                if($cats_slugs != false ) // filters, uri category. category slugs can be space separated
                {
                    $pag_segment = 4; // change pagination number position in URI
                    $pag_uri = "products/category/".$cats_slugs; 
                }
                /* name search */
                if($this->input->get('search') != null ) 
                {
                    $search = $this->input->get('search') ; // name search in GET 
                }
                
                /** convert category slug/s to id/s */
                $cat_slugids = $this->products_categories_m->categories_slug2id($cats_slugs) ;
                
                /** get products lists */
                $products = $this->products_m->products_get($search, $cat_slugids, $limit, $offset);
                
                /** get total result count for pagination  */
                $rescount = $this->products_m->products_count_all($search, $cat_slugids);
    
                /** create HTML tags */
                $products = $this->products_m->add_html($products);
                
		// we'll do a quick check here so we can tell tags whether there is data or not
		$items_exist = $products != false;
                // add line count
		if ($items_exist === true) 
                {
                    $count = 0 ;
                    foreach ( $products as $p => $p_details ) 
                    {
                        $count += 1;
                        $products[$p]['count'] = $count ;
                    }
                }
                    
		// we're using the pagination helper to do the pagination for us. Params are: (module/method, total count, limit, uri segment)
		$pagination = create_pagination($pag_uri, $rescount, $limit, $pag_segment);
                
		if (Settings::get('enable_comments'))
		{                    
			$this->load->library('comments/comments', array(
				'entry_id' => 'products',
				'entry_title' => 'Products',
				'module' => 'products',
				'singular' => 'products:post',
				'plural' => 'products:posts',
			));

			$this->template->set('show_comments', true);
		} else {
			$this->template->set('show_comments', false);
                }
                
                
		$this->template
			->title($this->module_details['name'], 'the rest of the page title')
//			->set_metadata('description', $category->title.'. '.$meta['description'])
//			->set_metadata('keywords', $category->title)
//			->set_breadcrumb(lang('blog:blog_title'), 'blog')
//			->set_breadcrumb($category->title)
			->set('result_count', $rescount)
			->set('products', $products)
			->set('items_exist', $items_exist)
			->set('pagination', $pagination)
			->build('products_t');
	}

        /**
	 * view product
	 */
	public function view($id)
	{	
		$product = $this->products_m
			->get_by('id', $id);
			
                $nested[] = $product;
                $nested = $this->products_m->add_html($nested);
                $product = $nested[0];
                
		if (Settings::get('enable_comments'))
		{                    
			$this->load->library('comments/comments', array(
				'entry_id' => 'products',
				'entry_title' => 'Products',
				'module' => 'products',
				'singular' => 'products:post',
				'plural' => 'products:posts',
			));

			$this->template->set('show_comments', true);
		} else {
			$this->template->set('show_comments', false);
                }
                
                
		$this->template
			->title('product')
			->build('view_t', $product);
	}
}