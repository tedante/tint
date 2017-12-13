<?php 

require './vendor/autoload.php';
require './app/config/database.php';

use duncan3dc\Laravel\BladeInstance;

$view = new BladeInstance("./app/view", "./resources/cache/views");

/**
 * $module is list of module will be load on the system
 * you can see module on system/module
 */
$module = [
	'connection',
	'controller',
	'model',
	'image',
	'security',
	'support',
];

foreach ($module as $item) {
	require './system/module/' . $item . '.php';
}

 ?>