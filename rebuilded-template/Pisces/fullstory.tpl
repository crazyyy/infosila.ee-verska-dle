<div class="base fullstory">
	<div class="dpad">
		<h3 class="btl"><span id="news-title">{title}</span></h3>
		<p class="binfo small">Автор: {author} от [day-news]{date}[/day-news], посмотрело: {views}</p>
		<div class="maincont">
			<span class="argcoms"><b>{comments-num}</b></span>
			{full-story}
            <div class="share42init" data-url="{full-link}" data-title="{title}"></div>
			<script type="text/javascript" src="/share42/share42.js"></script>
			<div class="clr"></div>
		</div>
		<div class="storenumber">{pages}</div>
		[edit-date]<p class="editdate small"><i>Изменил: <b>{editor}</b>[edit-reason] по причине: {edit-reason}[/edit-reason]</i></p>[/edit-date]
		[tags]<div class="btags"><div class="btags small">Теги: {tags}</div></div>[/tags]
		<div class="mlink[tags] mlinktags[/tags]"><div class="mlink">
			[poll]<span class="argpoll"><a id="polllink" href="#"><b>Опрос</b></a></span>[/poll]
			[not-group=5]
			<ul class="isicons reset">
				<li>[edit]<img src="{THEME}/dleimages/editstore.png" title="Редактировать" alt="Редактировать" />[/edit]</li>
				<li>{favorites}</li>
			</ul>
			[/not-group]

<!-- 			[rating]<div class="rate">{rating}</div>[/rating]
            [rating]
        		<div class="orating" id="orating-{news-id}">
		<a href="#" class="orating_m" title="Не нравится" onclick="orating({news-id},0);return false;"></a>
		<a href="#" class="orating_p" title="Нравится" onclick="orating({news-id},1);return false;"></a>
		<a href="#" class="orating_res" onclick="ostats({news-id},1,true);return false;">{rate-val}</a>
	</div>
[/rating] -->


            <div class="ignore-select">
	            <div class="rating-mg view-ratings">
	                <div id="mratesb-{r-id}" class="btn-group vote-buttons">
	                    <button class="btn like" onclick="rating_like('{r-id}', '1'); return false;" type="button"><span class="icon"></span>Понравилось</button>
	                    <button class="btn dislike" onclick="rating_like('{r-id}', '-1'); return false;" type="button"><span class="icon"></span>Не понравилось</button>
	                </div>

	                <div class="progress">
	                    <div id="success-{r-id}" class="bar bar-success"></div>
	                    <div id="dangers-{r-id}" class="bar bar-danger"></div>
	                </div>

	                <p class="result clearfix">
	                    <span class="like"><span id="l-{r-id}" class="count">{r-rp}</span> понравилось</span>
	                    <span class="dislike"><span id="d-{r-id}" class="count">{r-rm}</span> не понравилось</span>
	                </p>
	            </div>
	        </div><!-- ignore-select -->


		</div></div>
		<p class="argcat small">Категория: {link-category}</p>
	</div>
</div>
[related-news]
<div class="related">
	<div class="dtop"><span><b>А также:</b></span></div>
	<ul class="reset">
		{related-news}
	</ul>
</div>
[/related-news]
[group=5]
<div class="berrors" style="margin: 0;">
	Уважаемый посетитель, Вы зашли на сайт как незарегистрированный пользователь.<br />
	Мы рекомендуем Вам <a href="/index.php?do=register">зарегистрироваться</a> либо войти на сайт под своим именем.
</div>
[/group]
[poll]<div style="display: none;" id="polldialog" title="Опрос">{poll}</div>[/poll]



<script>
/* Megogo rating start */
$(function() {
	var mn = parseInt($("#d-{r-id}").html());
	var pl = parseInt($("#l-{r-id}").html());
	var su = pl + mn;
	var lp = Math.abs(pl/su*100);
	var lm = Math.abs(mn/su*100);
	$("#success-{r-id}").css({width:lp+'%'});
	$("#dangers-{r-id}").css({width:lm+'%'});
});
/* Megogo rating end */
</script>