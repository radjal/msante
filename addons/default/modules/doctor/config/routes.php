<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

$route['doctor/admin/categories(:any)'] = 'admin_categories$1';
$route['doctor/admin/organisations(:any)'] = 'admin_organisations$1';
$route['doctor/admin/streams(:any)'] = 'EDIT_ROUTES$1';

//test
//$route['doctor(/:any)?']			= 'doctor/index$1';