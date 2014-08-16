<!DOCTYPE html>
<html lang="ru">
<head>
    <meta name="google-site-verification" content="DEXGWa-d7c1s9TVLhzcZlL6omg3YipsLx-vL33pk9b4" />   
        <link rel="shortcut icon" href="{THEME}/images/favicon.ico" />
{headers}
    <script type="text/javascript" src="{THEME}/js/orating_pack.js"></script>
	<link media="screen" href="{THEME}/style/orating.css" type="text/css" rel="stylesheet" />
	<link href="{THEME}/style/styles.css" type="text/css" rel="stylesheet" />
	<link href="{THEME}/style/engine.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="{THEME}/js/slides.js"></script>
	<script type="text/javascript" src="{THEME}/js/libs.js"></script>
    <script type="text/javascript">
	//-----------------------------------
	//START COMMENTS RATING
	//-----------------------------------
	function comRate(rate,id) {
	ShowLoading("Голосуем за комментарий....");
	$.get(dle_root+"engine/ajax/comm_rating.php",
	{comm_id:id,go_rate:rate,skin:dle_skin},
	function(data){
	HideLoading("");
	$("#cratig-layer-"+id).html(data)}
	);
	return!1
	}
	//-----------------------------------
	// END COMMENTS RATING
	//-----------------------------------
	</script>
	<link media="screen" href="{THEME}/style/mstyle.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="{THEME}/js/mrating.js"></script>
</head> 
<body>
<script src="http://fortumo.com/javascripts/fortumopay.js" type="text/javascript"></script>    
{AJAX}
<div class="wwide pagebg">
	<div id="headbar">
		<div id="header">
			<div class="wrapper">
				<div class="container">
					<h1><a class="thide" href="/index.php" title="molodezka.ee">Новости, события, аналитика</a></h1>
					<div class="loginbox">{login}</div>
					<div class="headlinks">
						<ul class="reset">
							<li><a href="/index.php">Главная</a></li>
							<li><a href="/index.php?do=search">Поиск</a></li>
							<li><a href="/index.php?do=feedback">Контакты</a></li>
							<li><a href="/rss.xml">RSS</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="speedbar">
			<div class="wrapper">
				<div class="container">
					{speedbar}
				</div>
			</div>
		</div>
	</div>
	<div class="wrapper">
		<div id="toolbar" class="container">
			{include file="topmenu.tpl"}
			<form method="post" action=''>
				<input type="hidden" name="do" value="search" />
				<input type="hidden" name="subaction" value="search" />
				<ul class="searchbar reset">
					<li class="lfield"><input id="story" name="story" value="Поиск..." onblur="if(this.value=='') this.value='Поиск...';" onfocus="if(this.value=='Поиск...') this.value='';" type="text" /></li>
					<li class="lbtn"><input title="Найти" alt="Найти" type="image" src="{THEME}/images/spacer.gif" /></li>
				</ul>
			</form>
		</div>
		{include file="slider.tpl"}
		<div class="shadlr"><div class="shadlr">
			<div class="container">
				<div id="vseptop" class="wsh"><div class="wsh">&nbsp;</div></div>
				<div class="vsep"><div class="vsep">
					<div id="midside" class="rcol">
						<div class="hban"><div class="hban">
							<div class="dpad">{banner_header}</div>
						</div></div>
						[sort]<div class="dpad"><div class="sortn"><div class="sortn">{sort}</div></div></div>[/sort]
						{info}
						{content}
					</div>
					<div id="sidebar" class="lcol">
						{include file="sidebar.tpl"}
					</div>
					<div class="clr"></div>
				</div></div>
				<div id="vsepfoot" class="wsh"><div class="wsh">&nbsp;</div></div>
			</div>
		</div></div>
	</div>
</div>
<div class="wwide footbg">
	<div class="wrapper">
		<div class="container">
			<div class="ftbar"><div class="ftbar">
				<ul id="fmenu" class="reset">
					<li><a href="/index.php">Главная страница</a></li>
					[group=5]<li><a href="/index.php?do=register">Регистрация</a></li>[/group]
					[not-group=5]<li><a href="/addnews.html">Добавить новость</a></li>[/not-group]
					<li><a href="/newposts/">Новое на сайте</a></li>
					<li><a href="/statistics.html"></a></li>
				</ul>
				</div>
			</div></div>
			<div class="blocktags radial">
				{tags}
			</div>
		</div>
	</div>
</div>
<div class="wwide footer">
	<div class="wrapper">
		<div class="container">
			<h2><a class="thide" href="/index.php" title="Ühiskondliku Algatuste Liit MTÜ">Ühiskondliku Algatuste Liit MTÜ</a></h2>
          <span class="copyright">
				Copyright &copy;2013 <a href="http://molodezka.ee">Ühiskondliku Algatuste Liit MTÜ</a> All Rights Reserved.<br />
			<div class="counts">
				<ul class="reset">
					<!-- Yandex.Metrika counter -->
<script src="//mc.yandex.ru/metrika/watch.js" type="text/javascript"></script>
<script type="text/javascript">
try { var yaCounter22058230 = new Ya.Metrika({id:22058230,
          webvisor:true,
          clickmap:true,
          trackLinks:true,
          accurateTrackBounce:true,
          trackHash:true});
} catch(e) { }
</script>
<noscript><div><img src="//mc.yandex.ru/watch/22058230" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
              <li><img src="{THEME}/images/count.png" alt="count 88x31px" /></li>
				</ul>
			</div>
		</div>
              <a href="/"onclick="scroll(0,0); return false" class="thide toptop">Наверх</a>
	</div>
</div>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-53711910-1', 'auto');
  ga('send', 'pageview');

</script>
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 965812708;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/965812708/?value=0&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
</body>
</html>