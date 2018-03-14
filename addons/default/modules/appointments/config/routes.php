<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
| 	www.your-site.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://www.codeigniter.com/user_guide/general/routing.html
*/

// front-end
$route['appointments(/:num)?']			= 'appointments/index$1';
$route['appointments/paypal(/:num)?']			= 'appointments/paypal/index$1';
$route['appointments/commandes(/:num)?']			= 'appointments/listing$1';

// admin
$route['appointments/admin/list(/:any)?'] = 'admin_list$1';