/* Megogo rating start */
function rating_like(id, act){
	ShowLoading('');
    $.post(dle_root + "engine/ajax/mrating.php", {news_id:id, skin:dle_skin, go_rate:act}, function(data){
		HideLoading('');
		if(data==1){
			if(act=='1'){
				var mn = parseInt($("#d-"+id).html());
				var pl = parseInt($("#l-"+id).html())+1;
			}else{
				var mn = parseInt($("#d-"+id).html())+1;
				var pl = parseInt($("#l-"+id).html());
			}
			var su = pl + mn;
			var lp = Math.abs(pl/su*100);
			var lm = Math.abs(mn/su*100);
			$("#counter-"+id).html(su);
			$("#success-"+id).css({width:lp+'%'});
			$("#dangers-"+id).css({width:lm+'%'});
			$("#mratesb-"+id).find(".btn").attr('disabled', 'disabled');
			if(act=='1'){$("#l-"+id).html(pl);}else{$("#d-"+id).html(mn);}
		}
		if(data==0) $("#mratesb-"+id).find(".btn").attr('disabled', 'disabled'); /*DLEalert("Вы уже голосовали", dle_info);*/
	});
	return false;
}
/* Megogo rating end */