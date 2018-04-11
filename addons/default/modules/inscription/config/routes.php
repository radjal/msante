<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

$route['inscription/admin/categories(:any)'] = 'admin_categories$1'; 

$route['inscription(/:any)?']			= 'inscription/index$1';