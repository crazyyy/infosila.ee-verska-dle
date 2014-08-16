<?php
session_start();

@error_reporting ( E_ALL ^ E_WARNING ^ E_NOTICE );
@ini_set ( 'display_errors', true );
@ini_set ( 'html_errors', false );
@ini_set ( 'error_reporting', E_ALL ^ E_WARNING ^ E_NOTICE );

define('DATALIFEENGINE', true);
define('ROOT_DIR', dirname (__FILE__));
define('ENGINE_DIR', ROOT_DIR.'/engine');

include ENGINE_DIR.'/classes/mysql.php';
include ENGINE_DIR.'/data/dbconfig.php';
echo "<pre>";
$ch = $db->super_query("SELECT * FROM ".PREFIX."_logs LIMIT 1");
if(isset($ch['value'])) echo "Поле хранения значения голоса уже создано\n";
else{
	$db->query("ALTER TABLE `".PREFIX."_logs` ADD `value` TINYINT( 1 ) NOT NULL DEFAULT '0'");
	echo "Создано поле хранения значения голоса в таблице `".PREFIX."_logs`\n";
}
if(isset($ch['date'])) echo "Поле хранения даты уже создано\n";
else{
	$db->query("ALTER TABLE `".PREFIX."_logs` ADD `date` varchar( 15 ) NOT NULL");
	echo "Создано поле хранения даты голосования в таблице `".PREFIX."_logs`\n";
}

$ch = $db->super_query("SELECT * FROM ".PREFIX."_comments LIMIT 1");
if(isset($ch['rating'])) echo "Поле хранения рейтинга комментариев уже создано\n";
else{
	$db->query("ALTER TABLE `".PREFIX."_comments` ADD `rating` INT( 4 ) NOT NULL DEFAULT '0'");
	echo "Создано поле хранения значения рейтинга в таблице `".PREFIX."_comments`\n";
}

$db->query("CREATE TABLE IF NOT EXISTS `".PREFIX."_logs_comm` (`id` INT( 11 ) NOT NULL AUTO_INCREMENT PRIMARY KEY ,`comm_id` INT( 11 ) NOT NULL ,`member` VARCHAR( 40 ) NOT NULL ,`ip` VARCHAR( 15 ) NOT NULL ,`value` TINYINT( 1 ) NOT NULL ,`date` VARCHAR( 15 ) NOT NULL, INDEX ( `comm_id` ) )");

$ch = $db->super_query("SELECT * FROM ".PREFIX."_logs_comm LIMIT 1");
if(isset($ch['date'])) echo "Поле хранения даты рейтинга комментариев уже создано\n";
else{
	echo "<b>При первой установке может быть выведена ошибка. Не обращайте внимания, все необходимые запросы уже выполнены</b>\n";
	$db->query("ALTER TABLE `".PREFIX."_logs_comm` ADD `date` varchar( 15 ) NOT NULL");
	echo "Создано поле хранения даты рейтинга в таблице `".PREFIX."_logs_comm`\n";
}

@unlink(ROOT_DIR."/install.php");
echo "Модуль o-Rating успешно установлен!";
?>