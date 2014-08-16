<?php
@error_reporting ( E_ALL ^ E_WARNING ^ E_NOTICE );
@ini_set ( 'display_errors', true );
@ini_set ( 'html_errors', false );
@ini_set ( 'error_reporting', E_ALL ^ E_WARNING ^ E_NOTICE );
@session_start();

$go_rate = intval( $_POST['rate'] );
$news_id = intval( $_POST['news_id'] );
$go_rate = ($go_rate>0)?1:-1;
if(!$news_id ) die( "Hacking attempt!" );

define( 'DATALIFEENGINE', true );
define( 'ROOT_DIR', substr( dirname(  __FILE__ ), 0, -12 ) );
define( 'ENGINE_DIR', ROOT_DIR . '/engine' );
include ENGINE_DIR . '/data/config.php';
if( $config['http_home_url'] == "" ) {
	$config['http_home_url'] = explode( "engine/ajax/rating.php", $_SERVER['PHP_SELF'] );
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
		$autor = $db->super_query( "SELECT autor FROM " . PREFIX . "_post where id ='$news_id'" );
		if($member_id['name']==$autor['autor']) die("{\"msg\": \"Нельзя голосовать за себя\"}");
	}
	$_TIME = time () + ($config['date_adjust'] * 60);
	$member_name = $db->safesql($member_id['name']);
	if( $is_logged ) $where = "member = '{$member_name}'";
	else $where = "ip ='{$_IP}'";
	$row = $db->super_query( "SELECT news_id FROM " . PREFIX . "_logs where news_id ='$news_id' AND {$where}" );
	if( !$row['news_id'] AND count( explode( ".", $_IP ) ) == 4) {
		$db->query( "UPDATE " . PREFIX . "_post SET rating=rating+'$go_rate', vote_num=vote_num+1 WHERE id ='$news_id'" );
		if( $is_logged ) $user_name = $member_name;
		else $user_name = "noname";
		$db->query( "INSERT INTO " . PREFIX . "_logs (news_id, ip, member, value, date) values ('$news_id', '$_IP', '$user_name', '$go_rate', '$_TIME')" );
		if ( $config['allow_alt_url'] == "yes" AND !$config['seo_type'] ) $cprefix = "full_"; else $cprefix = "full_".$news_id;	
		clear_cache( array( 'news_', 'rss', $cprefix ) );
	}else die("{\"msg\": \"Вы уже голосовали\"}");
}else die("{\"msg\": \"Вы не зарегистрированы\"}");
$row = $db->super_query("SELECT rating FROM ".PREFIX."_post WHERE id={$news_id}");
echo "{\"rating\":\"{$row['rating']}\",\"msg\":\"\"}";
?>