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

$limit = 10;

$news_id = intval($_POST['news_id']);
$p = max(1,intval($_POST['p']));
$cstart = ($p-1)*$limit;
if($news_id<1 ) die( "Hacking attempt!" );
include ENGINE_DIR . '/data/config.php';
if( $config['http_home_url'] == "" ) {
	$config['http_home_url'] = explode( "engine/ajax/rating_stats.php", $_SERVER['PHP_SELF'] );
	$config['http_home_url'] = reset( $config['http_home_url'] );
	$config['http_home_url'] = "http://" . $_SERVER['HTTP_HOST'] . $config['http_home_url'];
}
require_once ENGINE_DIR . '/classes/mysql.php';
require_once ENGINE_DIR . '/data/dbconfig.php';
require_once ENGINE_DIR . '/modules/functions.php';

$_REQUEST['skin'] = trim(totranslit($_REQUEST['skin'], false, false));
if($_REQUEST['skin'] AND !@is_dir( ROOT_DIR . '/templates/' . $_REQUEST['skin'] ) ) die( "Hacking attempt!" );
$_TIME = time () + ($config['date_adjust'] * 60);
if( $_REQUEST['skin'] AND $config["lang_" . $_REQUEST['skin']] ){
	if ( file_exists( ROOT_DIR . '/language/' . $config["lang_" . $_REQUEST['skin']] . '/website.lng' ) ) @include_once (ROOT_DIR . '/language/' . $config["lang_" . $_REQUEST['skin']] . '/website.lng');
	else die("Language file not found");
}else @include_once ROOT_DIR . '/language/' . $config['langs'] . '/website.lng';
$config['charset'] = ($lang['charset'] != '') ? $lang['charset'] : $config['charset'];

$sql = $db->query( "SELECT member,value,date FROM " . PREFIX . "_logs WHERE news_id ='$news_id' ORDER BY id DESC LIMIT {$cstart},{$limit}" );
$count = $db->super_query( "SELECT count(*) as c FROM ".PREFIX."_logs WHERE news_id ='$news_id'" );
if($count['c']==0) $list = "<li class=\"onoentry\">Нет голосов</li>";
else{
	$list = "";
	while($row = $db->get_row($sql)){
		if($row['date']){
			if( date( 'Ymd', $row['date'] ) == date( 'Ymd', $_TIME ) ) $date = $lang['time_heute'] . date( ", H:i", $row['date'] );
			elseif( date( 'Ymd', $row['date'] ) == date( 'Ymd', ($_TIME - 86400) ) ) $date = $lang['time_gestern'] . date( ", H:i", $row['date'] );
			else $date = date("d.m.Y",$row['date']);
		}else $date = "- - -";
		if($row['value']>0) $stat = "plus";
		elseif($row['value']<0) $stat = "minus";
		else $stat .= "none";
		if($row['member']!='noname') $link = "/user/".urlencode($row['member'])."/";
		else{
			$row['member'] = "Гость";
			$link = "#";
		}
		$list .= "<li class=\"ostat-{$stat}\"><span>{$date}</span><a href=\"{$link}\" class=\"orating_profile\">{$row['member']}</a></li>";
	}
}
$buffer = "<ul>{$list}</ul>";
if($count['c']>0){
	$oplusbar = $db->super_query( "SELECT count(*) as c FROM ".PREFIX."_logs WHERE news_id ='$news_id' AND value>0" );
	$oplus = $oplusbar['c'];
	$ominus = $count['c'] - $oplusbar['c'];
	$oplusbar = $left = floor($oplusbar['c']/$count['c']*100);
	if($count['c']>0) $ominusbar = 100 - $oplusbar;
	else{
		$ominusbar = 0;
		$left = 50;
	}
	$buffer .= <<<HTML
<div id="orating-bar" title="+$oplus | -$ominus">
	<div id="orating-bar-oplus" style="width:{$oplusbar}%;"><p>{$oplus}</p></div>
	<div id="orating-bar-ominus" style="width:{$ominusbar}%;"><p>{$ominus}</p></div>
	<div id="orating-bar-separator" style="left:{$left}%;"></div>
</div>
HTML;
}

if($count['c']>$limit){
	$cstart = $p;
	$count = $count['c'];
	$end_page = ceil($count/$limit);
	if($cstart>$end_page) $cstart = $end_page;
	if($cstart<2) $navigation = "<span class=\"usernavistart\"></span>";
	else{
		$prev = $cstart - 1;
		$navigation = "<a href=\"#\" onclick=\"ostats({$news_id},{$prev});return false;\" class=\"usernavistart\" title=\"Назад\"></a>";
	}
	$navigation .= "<div class=\"opages\">";
	for($i=1;$i<=$end_page;$i++){
		if($cstart==$i) $navigation .= "<span class=\"usernaviposi\">{$i}</span>";
		else $navigation .= "<a href=\"#\" onclick=\"ostats({$news_id},{$i});return false;\">{$i}</a>";
	}
	$navigation .= "</div>";
	if($cstart==$end_page) $navigation .= "<span class=\"usernaviend\"></span>";
	else{
		$next = min($cstart+1,$end_page);
		$navigation .= "<a href=\"#\" onclick=\"ostats({$news_id},{$next});return false;\" class=\"usernaviend\" title=\"Вперед\"></a>";
	}
	$buffer .= "<div class=\"onavi\">".$navigation."</div>";
}
$db->close();
@header( "Content-type: text/html; charset=" . $config['charset'] );
echo $buffer;
?>