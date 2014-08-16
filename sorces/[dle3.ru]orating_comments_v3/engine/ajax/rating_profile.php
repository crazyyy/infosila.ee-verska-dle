<?php
/*
=====================================================
 DataLife Engine - by SoftNews Media Group 
-----------------------------------------------------
 http://dle-news.ru/
-----------------------------------------------------
 Copyright (c) 2004,2012 SoftNews Media Group
=====================================================
 Данный код защищен авторскими правами
=====================================================
 Файл: rating.php
-----------------------------------------------------
 Назначение: AJAX для рейтинга
=====================================================
*/
@session_start();
@error_reporting ( E_ALL ^ E_WARNING ^ E_NOTICE );
@ini_set ( 'display_errors', true );
@ini_set ( 'html_errors', false );
@ini_set ( 'error_reporting', E_ALL ^ E_WARNING ^ E_NOTICE );

define( 'DATALIFEENGINE', true );
define( 'ROOT_DIR', substr( dirname(  __FILE__ ), 0, -12 ) );
define( 'ENGINE_DIR', ROOT_DIR . '/engine' );

$limit = 100;

include ENGINE_DIR . '/data/config.php';
if( $config['http_home_url'] == "" ) {
	$config['http_home_url'] = explode( "engine/ajax/rating_profile.php", $_SERVER['PHP_SELF'] );
	$config['http_home_url'] = reset( $config['http_home_url'] );
	$config['http_home_url'] = "http://" . $_SERVER['HTTP_HOST'] . $config['http_home_url'];
}
require_once ENGINE_DIR . '/classes/mysql.php';
require_once ENGINE_DIR . '/data/dbconfig.php';
require_once ENGINE_DIR . '/modules/functions.php';

$name = $db->safesql(iconv("UTF-8","windows-1251//IGNORE",$_POST['name']));
if(!$name) die('Hacking attempt!');

if(isset($_POST['rating'])){
	echo user_orating($name);
	die();
}

$cat_info = get_vars ( "category" );
if (! is_array ( $cat_info )) {
	$cat_info = array ();
	$db->query ( "SELECT * FROM " . PREFIX . "_category ORDER BY posi ASC" );
	while ( $row = $db->get_row () ) {
		$cat_info[$row['id']] = array ();
		foreach ( $row as $key => $value ) $cat_info[$row['id']][$key] = stripslashes ( $value );
	}
	set_vars ( "category", $cat_info );
	$db->free ();
}
$_REQUEST['skin'] = trim(totranslit($_REQUEST['skin'], false, false));
if($_REQUEST['skin'] AND !@is_dir( ROOT_DIR . '/templates/' . $_REQUEST['skin'] ) ) die( "Hacking attempt!" );
$_TIME = time () + ($config['date_adjust'] * 60);
if( $_REQUEST['skin'] AND $config["lang_" . $_REQUEST['skin']] ){
	if ( file_exists( ROOT_DIR . '/language/' . $config["lang_" . $_REQUEST['skin']] . '/website.lng' ) ) @include_once (ROOT_DIR . '/language/' . $config["lang_" . $_REQUEST['skin']] . '/website.lng');
	else die("Language file not found");
}else @include_once ROOT_DIR . '/language/' . $config['langs'] . '/website.lng';
$config['charset'] = ($lang['charset'] != '') ? $lang['charset'] : $config['charset'];

$sql = $db->query( "SELECT p.id as pid,p.date as pdate,p.title as ptitle,p.category as pcategory,p.alt_name as palt_name,l.value as logval,l.date as logdate FROM " . PREFIX . "_logs l LEFT JOIN ".PREFIX."_post p ON l.news_id=p.id WHERE l.member='$name' AND p.id ORDER BY l.date DESC LIMIT 0,{$limit}" );
$list = "";
while($row = $db->get_row($sql)){
	if($row['logdate']){
		if( date( 'Ymd', $row['logdate'] ) == date( 'Ymd', $_TIME ) ) $date = $lang['time_heute'] . date( ", H:i", $row['logdate'] );
		elseif( date( 'Ymd', $row['logdate'] ) == date( 'Ymd', ($_TIME - 86400) ) ) $date = $lang['time_gestern'] . date( ", H:i", $row['logdate'] );
		else $date = date("d.m.Y",$row['logdate']);
	}else $date = "- - -";
	if($row['logval']>0) $stat = "plus";
	elseif($row['logval']<0) $stat = "minus";
	else $stat .= "none";
	$row['pdate'] = strtotime( $row['pdate'] );
	$row['pcategory'] = intval( $row['pcategory'] );
	if( $config['allow_alt_url'] == "yes" ) {
		if( $config['seo_type'] == 1 OR $config['seo_type'] == 2  ) {
			if( $row['pcategory'] and $config['seo_type'] == 2 ) $full_link = $config['http_home_url'] . get_url( $row['pcategory'] ) . "/" . $row['pid'] . "-" . $row['palt_name'] . ".html";
			else $full_link = $config['http_home_url'] . $row['pid'] . "-" . $row['palt_name'] . ".html";
		}else $full_link = $config['http_home_url'] . date( 'Y/m/d/', $row['pdate'] ) . $row['palt_name'] . ".html";
	}else $full_link = $config['http_home_url'] . "index.php?newsid=" . $row['pid'];
	$list .= "<li class=\"ostat-{$stat}\"><span>{$date}</span><a href=\"{$full_link}\" target=\"_blank\">".stripslashes($row['ptitle'])."</a></li>";
}

$db->close();
@header( "Content-type: text/html; charset=" . $config['charset'] );
echo $list;
?>