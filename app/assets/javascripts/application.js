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
//= require Chart.min.js

$(document).ready(function(){

	  window.onerror = function (m){
	  alert(m)
	  }

    $('.timepicker').pickatime({
        clear: ''
    })

    $('.victor').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
        function(){
            $('.victor').removeClass('animated fadeInDown')
            $('.victor').addClass('animated bounce').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
                function(){
                    $('.victor').removeClass('animated bounce')
                 })
        })

    $('.animated bounce').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
        function(){
            $('.victor').removeClass('animated bounce')
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

    $('#profile_submit').click(function(event){
        event.preventDefault();
        $('#step_3').addClass("fadeOutRight").one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
            function(){
                $('#profile_form').submit();
            })
    });

    $('.track_select_button').click(function(event){
                // event.preventDefault();
        $('.track_array').addClass("animated fadeOutRight").one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
            function(){
                $('.track_select_button').submit();
            })
    });

    $('.task_victory_button').click(function(event){
        event.preventDefault();
        $('#task_div').addClass("fadeOutRight").one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
            function(){
                $('#completion_form').submit();
            })
    });

    $('.dashboard_start_task_button').click(function(event){
        // event.preventDefault();
        $('.dashboard_header').addClass("fadeOutRight")
        $('.dashboard_recap').addClass("fadeOutRight")
        $('.chart_1_fade').addClass("fadeOutRight")
        $('.chart_2_fade').addClass("fadeOutRight")
        $('.chart_2_fade').removeClass("fadeInLeft")
        $('.chart_3_fade').addClass("fadeOutRight").one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
            function(){
                $('.dashboard_start_task_button').submit();
            })
    });

    $('#task_submit_button').hide();
    $('.countdown_timer').hide();
    $('.timer_submit_button').click(function(){
        $('.countdown_timer').addClass("animated fadeIn");
        $('.countdown_timer').fadeIn();
        $('#task_submit_button').addClass("animated fadeIn");
        $('#task_submit_button').fadeIn();
    })

    $('#task_submit_button').click(function(event){
        event.preventDefault();
        $('#task_div').addClass("animated fadeOutRight").one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
            function(){
                $('#task_submit_button').submit();
            })
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