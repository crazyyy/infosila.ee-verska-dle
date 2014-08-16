	<div class="bcomment">
		<div class="lcol">
			<span class="thide arcom">&lt;</span>
			<div class="avatar">
				<img src="{foto}" alt=""/>
				{group-icon}
			</div>
			<ul class="small reset">
				<li>Публикаций: {news-num}</li>
				<li>Комментариев: {comm-num}</li>
                <li>
					<div class="ocomm" id="ocomm-{id}">
						<a href="#" class="orating_m" title="Не нравится" onclick="ocomrate({id},0);return false;"></a>
						<a href="#" class="orating_p" title="Нравится" onclick="ocomrate({id},1);return false;"></a>
						<a href="#" class="ocomm_res" onclick="ocomstat({id},1,true);return false;">{rating}</a>
					</div>
                </li>
			</ul>
		</div>
		<div class="rcol">
			<div class="dpad dtop ignore-select">
				<span>{date}</span>
				<h3>{author}</h3>
			</div>
			<div class="dpad cominfo">
				<span class="argreply">[fast]<b>Цитата</b>[/fast]</span>
				<ul class="reset small">
					<li>Группа: {group-name}</li>
					<li>Регистрация: {registration}</li>
					<li>Статус: [online]<img src="{THEME}/images/online.png" style="vertical-align: middle;" title="Пользователь Онлайн" alt="Пользователь Онлайн" />[/online][offline]<img src="{THEME}/images/offline.png" style="vertical-align: middle;" title="Пользователь offline" alt="Пользователь offline" />[/offline]</li>
				</ul>
				<span class="dleft">&nbsp;</span>
			</div>
			<div class="dpad dcont">
				[aviable=lastcomments]<h3 style="margin-bottom: 0.4em;">{news_title}</h3>[/aviable]
				{comment}
				<br clear="all" />
				[signature]<div class="signature">--------------------</div><div class="slink">{signature}</div><br />[/signature]
			</div>
			[not-group=5]
			<div class="dpad comedit">
				<ul class="reset small">
					<li>[spam]Спам[/spam]</li>
					<li>[complaint]Жалоба[/complaint]</li>
					<li>[com-edit]Изменить[/com-edit]</li>
					<li>[com-del]Удалить[/com-del]</li>
					[group=1]<li class="selectmass">{mass-action}</li>[/group]
				</ul>
			</div>
			[/not-group]					
		</div>
		<div class="clr"></div>
	</div>