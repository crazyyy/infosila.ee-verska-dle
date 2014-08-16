<?php
@error_reporting ( E_ALL ^ E_WARNING ^ E_NOTICE );
@ini_set ( 'display_errors', true );
@ini_set ( 'html_errors', false );
@ini_set ( 'error_reporting', E_ALL ^ E_WARNING ^ E_NOTICE );
@session_start();

$go_rate = intval( $_POST['rate'] );
$comm_id = intval( $_POST['comm_id'] );
$go_rate = ($go_rate>0)?1:-1;
if(!$comm_id ) die( "Hacking attempt!" );

define( 'DATALIFEENGINE', true );
define( 'ROOT_DIR', substr( dirname(  __FILE__ ), 0, -12 ) );
define( 'ENGINE_DIR', ROOT_DIR . '/engine' );
include ENGINE_DIR . '/data/config.php';
if( $config['http_home_url'] == "" ) {
	$config['http_home_url'] = explode( "engine/ajax/rating_comm.php", $_SERVER['PHP_SELF'] );
	$config['http_home_url'] = reset( $config['http_home_url'] );
	$config['http_home_url'] = "http://" . $_SERVER['HTTP_HOST'] . $config['http_home_url'];
}
require_once ENGINE_DIR . '/classes/mysql.php';
require_once ENGINE_DIR . '/data/dbconfig.php';
require_once ENGINE_DIR . '/modules/functions.php';

$_REQUEST['skin'] = totranslit($_REQUEST['skin'], false, false);
if( $_REQUEST['skin'] ){
	if( @is_dir( ROOT_DIR . '/templates/' . $_REQUEST['skin'] ) ) $config['skin'] = $_REQUEST['skin'];
	else die( "Hacking attempt!" );
}
if( $config["lang_" . $config['skin']] ) {
	if ( file_exists( ROOT_DIR . '/language/' . $config["lang_" . $config['skin']] . '/website.lng' ) ) {	
		include_once ROOT_DIR . '/language/' . $config["lang_" . $config['skin']] . '/website.lng';
	} else die("Language file not found");
} else include_once ROOT_DIR . '/language/' . $config['langs'] . '/website.lng';
$config['charset'] = ($lang['charset'] != '') ? $lang['charset'] : $config['charset'];
//################# Определение групп пользователей
$user_group = get_vars( "usergroup" );
if( ! $user_group ) {
	$user_group = array ();
	$db->query( "SELECT * FROM " . USERPREFIX . "_usergroups ORDER BY id ASC" );
	while ( $row = $db->get_row() ) {
		$user_group[$row['id']] = array ();
		foreach ( $row as $key => $value ) $user_group[$row['id']][$key] = stripslashes($value);
	}
	set_vars( "usergroup", $user_group );
	$db->free();
}
@header( "Content-type: text/html; charset=" . $config['charset'] );
require_once ENGINE_DIR . '/modules/sitelogin.php';
if( ! $is_logged ) $member_id['user_group'] = 5;
if( $user_group[$member_id['user_group']]['allow_rating'] ){
	if($is_logged){
		$autor = $db->super_query( "SELECT autor FROM " . PREFIX . "_comments where id = {$comm_id}" );
		if($member_id['name']==$autor['autor']) die("{\"msg\": \"Нельзя голосовать за себя\"}");
	}
	$_IP = $db->safesql( $_SERVER['REMOTE_ADDR'] );
	$_TIME = time () + ($config['date_adjust'] * 60);
	$member_id['name'] = $db->safesql($member_id['name']);
	if( $is_logged ) $where = "member = '{$member_id['name']}'";
	else $where = "ip ='{$_IP}'";
	$row = $db->super_query( "SELECT comm_id FROM " . PREFIX . "_logs_comm where comm_id = {$comm_id} AND {$where}" );
	if( !$row['comm_id'] AND count( explode( ".", $_IP ) ) == 4 ) {
		$db->query( "UPDATE " . PREFIX . "_comments SET rating=rating+'$go_rate' WHERE id = {$comm_id}" );
		if( $is_logged ) $user_name = $member_id['name'];
		else $user_name = "noname";
		$db->query( "INSERT INTO " . PREFIX . "_logs_comm (comm_id, ip, member, value, date) values ('$comm_id', '$_IP', '$user_name', '$go_rate', '$_TIME')" );
		if ( $config['allow_alt_url'] == "yes" AND !$config['seo_type'] ) $cprefix = "full_"; else $cprefix = "full_".$comm_id;	
		clear_cache( $cprefix );
	}else die("{\"msg\": \"Вы уже голосовали\"}");
}else die("{\"msg\": \"Вы не зарегистрированы\"}");
$row = $db->super_query("SELECT rating FROM ".PREFIX."_comments WHERE id={$comm_id}");
echo "{\"rating\":\"{$row['rating']}\",\"msg\":\"\"}";
?>