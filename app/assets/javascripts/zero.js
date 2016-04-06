$(document).ready(function() {
	"use strict";
  
	$('.toggle-menu').jPushMenu();

	$(".fancybox-activities").fancybox();
	$(".fancybox-previous-versions").fancybox();
		
	$('#horizontal-nav').affix({
	  offset: {
			top: 655
	  }
	})
	.on('affix.bs.affix', function () {
    $('#horizontal-nav.navbar-default .container').show();
    $('.ion-navicon-round').addClass('black');
	})
	.on('affix-top.bs.affix', function () {
    $('#horizontal-nav.navbar-default .container').hide();
    $('.ion-navicon-round').removeClass('black');
	});

  $("#contact_us").submit(function(e){
    $("#contact_us button").attr('disabled', 'disabled');
  });

  var onMobile = false;
  if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
    onMobile = true;
  }

  if(onMobile === false){
    $('#home').addClass('video-section');
    $(".player").mb_YTPlayer();
  } else {
    $('#home').addClass('no-video-section');
    $(".player").hide();
  }

  if($(".digg_pagination")){
    $(".digg_pagination a").each(function(index, el) {
      $(el).attr('data-no-turbolink', 'true');
    });    
  }

});

if(document.getElementById('grid-activities')){
  new GridScrollFx(document.getElementById('grid-activities'), { viewportFactor: 0.4 });
}
if(document.getElementById('grid-previous-versions')){
  new GridScrollFx(document.getElementById('grid-previous-versions'), { viewportFactor: 0.4 });
}
		
// Wow animations
wow = new WOW({
	animateClass: 'animated',
	offset: 100
});

wow.init();