var hidecomm = [], rateval = 0, oleft = 0, otop = 0;

(function($){
	$.fn.livedrag = function(opts){
		this.live("mouseenter",function(){
			if(!$(this).data("init"))$(this).data("init", true).draggable(opts);
		});
		return false;
	};
}(jQuery));
$(function(){
	$(".orating_res").each(function(){
		rateval = parseInt($(this).html());
		if(rateval>39) $(this).parent().addClass("ogold");
		else if(rateval>0) $(this).parent().addClass("oplus");
		else if(rateval<-39) $(this).parent().addClass("oblack");
		else if(rateval<0) $(this).parent().addClass("ominus");
	});
	$(".ocomm_res").each(function(){
		rateval = parseInt($(this).html());
		if(rateval>0) $(this).parent().addClass("oplus");
		else if(rateval<0){
			$(this).parent().addClass("ominus");
			if(rateval<-4){
				var id = $(this).parent().attr('id').split("-");
				hidecomm[id[1]] = $("#comment-id-"+id[1]).html();
				$("#comment-id-"+id[1]).html('<div class="comm_hide">���� ����������� ������� ������� ����� ������� ������.<a href="#" onclick="showcomm('+id[1]+');return false;">��������</a></div>');
			}
		}
	});
	$(".ostats").livedrag({handle:"h4"});
	$(".ostats_area .oclose").live("click",function(){
		$(".ostats").fadeOut(400,function(){$(this).remove();});
		return false;
	});
	$("#ostats-user-ratings .oclose").live("click",function(){
		ostat_profile_clear();
		return false;
	});
	$(".orating a, .ocomm a").live({click:function(e){
		$(".ostats").remove();
		$("body").append('<div class="ostats"><div class="ostats_area"><a href="#" class="oclose" title="�������"></a><h4>���������� �����������</h4><div class="ostats_rows"></div></div></div>');
		oleft = e.pageX - parseInt($('.ostats').width()) - 35;
		otop = e.pageY-15;
		$(".ostats").css({top:otop,left:oleft});
	}});
	$(".orating_profile").live({click:function(){
		$("#ostats-userinfo").remove();
		ostat_profile_clear();
		var href = $(this).attr('href');
		if(href=='#') return false;
		var name = $(this).html();
		$("body").addClass('oload');
		var list = $(this).parent();
		$.post(dle_root+'engine/ajax/rating_profile.php',{name:name,rating:1,skin:dle_skin},function(rateval){
			$("body").removeClass('oload');
			list.append("<div id='ostats-userinfo'><div id='okarma' class='ogray' title='�����'>"+rateval+"</div><a href='/user/"+name+"/' target='_blank'>�������</a><a href='#' onclick='orating_profile_log(\""+name+"\");return false;'>������</a><a href='#' class='close'>x</a></div>");
			if(rateval>39) $("#okarma").addClass("ogold");
			else if(rateval>0) $("#okarma").addClass("oplus");
			else if(rateval<-39) $("#okarma").addClass("oblack");
			else if(rateval<0) $("#okarma").addClass("ominus");
			$("#ostats-userinfo").fadeIn(500);
		});
		return false;
	}});
	$("#ostats-userinfo .close").live({click:function(){
		$("#ostats-userinfo").fadeOut(400,function(){$(this).remove()});
		ostat_profile_clear();
		return false;
	}});
})

function ostat_profile_clear(){
	$("#ostats-user-ratings").remove();
	$(".ostats").removeClass("ostats-uservotes");
	$(".ostats_area").removeClass('ostats-uservotes-area');
}

function orating_profile_log(name){
	$("#ostats-user-ratings").remove();
	$("body").addClass('oload');
	$.post(dle_root+'engine/ajax/rating_profile.php',{name:name,skin:dle_skin},function(d){
		$("body").removeClass('oload');
		var height = $(".ostats_area").height() - 4;
		var ulheight = height - $(".ostats h4").height();
		$(".ostats_area").addClass('ostats-uservotes-area');
		$(".ostats").addClass('ostats-uservotes').prepend("<div id='ostats-user-ratings' style='height:"+height+"px;'><a href='#' class='oclose' title='�������'></a><h4>��������� ������ ������������: <b>"+name+"</b></h4><ul style='height:"+ulheight+"px;'></ul></div>");
		$("#ostats-user-ratings ul").html(d);
	});
	return false;
}

function ocomrate(id,rate){
	var area = $("#ocomm-"+id);
	$("body").addClass('oload');
	$.post(dle_root+'engine/ajax/rating_comm.php',{comm_id:id,rate:rate,skin:dle_skin},function(data){
		$("body").removeClass('oload');
		if(data.msg){
			$(".ostats_area h4").html("��������");
			$(".ostats_rows").html('<ul><li class="onoentry">'+data.msg+'</li></ul>');
			$(".ostats").slideDown(600);
		}else{
			if(data.rating > 0){
				data.rating = "+"+data.rating;
				area.removeClass('ominus').addClass("oplus");
			}else if(data.rating < 0) area.removeClass('oplus').addClass("ominus");
			else area.removeClass('oplus').removeClass('ominus');
			area.find('.ocomm_res').html(data.rating);
		}
	},"json");
	area.find("a.orating_m, a.orating_p").addClass('orated').removeAttr('href').removeAttr('title').removeAttr('onclick');
	return false;
}

function ocomstat(id,p,n){
	var area = $("#ocomm-"+id);
	$("body").addClass('oload');
	$(".ostats_rows").fadeTo(300,0.01);
	$.post(dle_root+'engine/ajax/rating_comm_stats.php',{comm_id:id,p:p},function(data){
		$("body").removeClass('oload');
		$('.ostats_rows').html(data);
		if(n) $(".ostats").slideDown(600);
		else $(".ostats_rows").stop(true,true).fadeTo(400,1);
	});
	return false;
}
function orating(id,rate){
	var area = $("#orating-"+id);
	$("body").addClass('oload');
	$.post(dle_root+'engine/ajax/rating.php',{news_id:id,rate:rate,skin:dle_skin},function(data){
		$("body").removeClass('oload');
		if(data.msg){
			$(".ostats_area h4").html("��������");
			$(".ostats_rows").html('<ul><li class="onoentry">'+data.msg+'</li></ul>');
			$(".ostats").slideDown(600);
		}else{
			if(data.rating > 39){
				data.rating = "+"+data.rating;
				area.removeClass('ominus oplus oblack').addClass("ogold");
			}else if(data.rating > 0){
				data.rating = "+"+data.rating;
				area.removeClass('ominus ogold oblack').addClass("oplus");
			}else if(data.rating < -39) area.removeClass('oplus ogold ominus').addClass("oblack");
			else if(data.rating < 0) area.removeClass('oplus ogold oblack').addClass("ominus");
			else area.removeClass('oplus ominus ogold oblack');
			area.find(".orating_res").html(data.rating);
		}
	},"json");
	area.find("a.orating_m, a.orating_p").addClass('orated').removeAttr('href').removeAttr('title').removeAttr('onclick');
	return false;
}

function ostats(id,p,n){
	var area = $("#orating-"+id);
	$("body").addClass('oload');
	$(".ostats_rows").fadeTo(300,0.01);
	ostat_profile_clear();
	$.post(dle_root+'engine/ajax/rating_stats.php',{news_id:id,p:p},function(data){
		$("body").removeClass('oload');
		$('.ostats_rows').html(data);
		if(n) $(".ostats").slideDown(600);
		else $(".ostats_rows").stop(true,true).fadeTo(400,1);
	});
	return false;
}
function showcomm(id){
	$("#comment-id-"+id).html(hidecomm[id]);
	return false;
}