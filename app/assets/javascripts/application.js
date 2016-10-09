// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .
//= require bootstrap-sprockets
//= require Chart.bundle.min
//= require TimeCircles.js
//= require moment.min.js
//= require jquery.mousewheel.min.js
//= require raphael-2.1.4.min.js
//= require justgage.js
//= require picker.js 
//= require picker.time.js
//= require Chart.js

$(document).ready(function(){

	  window.onerror = function (m){
	  alert(m)
	  }

    $('.timepicker').pickatime({
        clear: ''
    })


    $('.victor').click(function(){
    	$('.victor').addClass("animated bounce").one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
            function(){
                $('.victor').removeClass('animated bounce')
            });

    });

    $( function() {
    	$( "#menu" ).menu();
  })

    $('.step_2').hide();
    $('.step_3').hide();

    $('.next_step_1').click(function(event){
        event.preventDefault();
        $('#step_1').addClass("fadeOutRight").one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
            function(){
                $('.step_1').hide();
                $('#step_2').addClass("fadeInLeft")
                $('.step_2').fadeIn();
            });
    });

    $('.next_step_2').click(function(event){
        event.preventDefault();
        $('#step_2').addClass("fadeOutRight").one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
            function(){
                $('.step_2').hide();
                $('#step_3').addClass("fadeInLeft")
                $('.step_3').fadeIn();
            });
        // $('.step_2').fadeOut();
        // $('.step_3').fadeIn();
    });

    $("#DateCountdown").TimeCircles(
        { time: {
        Days: {show: false},
        Hours: {show: false},
        Minutes: {show: false},
        Seconds: {show: true}
        },
        count_past_zero: false,
        circle_bg_color: "#3C78D8",
        use_background: false,
        start: false,
        total_duration: "Auto",
        start_angle: 0
    });
    $("#start").click(function(){ 
        $(".demo.stopwatch").TimeCircles().start(); 
    });
        var $container = $('#DateCountdown .textDiv_Seconds');
        $container.find('h4').text('Minutes');
        var $original = $container.find('span');
        var $clone = $original.clone().appendTo($container);
        $original.hide();

        $('#DateCountdown').TimeCircles().addListener(function(unit, value, total) {
            total = Math.abs(total);
            var minutes = Math.floor(total / 60) % 60;
            $clone.text(minutes);
            if(total == 0) {
                $('.task_victory_button').attr('id', 'times_up')
                $('#times_up').text("Time's Up :(")
                $('#completed').attr('value', 'false')
            }
        });
 
});