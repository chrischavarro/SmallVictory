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
//= require picker.js 
//= require picker.time.js
//= require Chart.min.js

$(document).ready(function(){

        $.fn.extend({
            animateCss: function (animationName) {
                var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
                this.addClass('animated ' + animationName).one(animationEnd, function() {
                    $(this).removeClass('animated ' + animationName);
                });
            }
        });


	  window.onerror = function (m){
	  alert(m)
	  }
// HOME PAGE
      $('#log_in').click(function(event){
        event.preventDefault();
        $('#fade_on_click').addClass("animated fadeOutUp").one('webkitAnimationEnd mozAnimationEnd oanimationend animationend',
            function(){
                window.location = "http://smallvictory.co/users/sign_in";
            })
      });      

      $('#sign_up').click(function(event){
        event.preventDefault();
        $('#fade_on_click').addClass("animated fadeOutUp").one('webkitAnimationEnd mozAnimationEnd oanimationend animationend',
            function(){
                window.location = "http://smallvictory.co/users/sign_in";
            })
      });

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

    $('.victor').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
        function(){
            $('.victor').removeClass('animated fadeInDown')
            $('.victor').addClass('animated bounce').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
                function(){
                    $('.victor').removeClass('animated bounce')
                 })
        });

// LOG IN PAGE
      $('#login_user').click(function(event){
        event.preventDefault();
        $('#fade_right').addClass("fadeOutRight").one('webkitAnimationEnd mozAnimationEnd oanimationend animationend',
            function(){
                $('#log_in_form').submit();
            })
      })

    $('#not_user_yet').click(function(event){
        $('#fade_right').addClass("fadeOutRight").one('webkitAnimationEnd mozAnimationEnd oanimationend animationend',
            function(){
                $('#already_signed_up').submit();
            })
    });    

    $('.fb_button').click(function(event){
        $('#fade_right').addClass("fadeOutRight")
    });    

    $('.twtr_button').click(function(event){
        $('#fade_right').addClass("fadeOutRight")
    });

// SIGN UP PAGE
      $('#signup_user').click(function(event){
        event.preventDefault();
        $('#fade_right').addClass("fadeOutRight").one('webkitAnimationEnd mozAnimationEnd oanimationend animationend',
            function(){
                $('#sign_up_form').submit();
            })
      })

    $('#already_signed_up').click(function(event){
        // event.preventDefault();
        $('#fade_right').addClass("fadeOutRight").one('webkitAnimationEnd mozAnimationEnd oanimationend animationend',
            function(){
                $('#already_signed_up').submit();
            })
      })



    $('.timepicker').pickatime({
        clear: ''
    })




// PROFILE SETUP PAGE
    $('.step_2').hide();
    $('.step_3').hide();

    $('.victor_profile').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
        function(){
            $('.victor_profile').removeClass('bounce')
        });    

    $('.profile_greeting').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
        function(){
            $('.profile_greeting').removeClass('fadeInDown')
        });

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
    });

    $('#profile_submit').click(function(event){
        event.preventDefault();
        $('.profile_greeting').addClass(" fadeOutUp");
        $('.victor_profile').addClass("fadeOutUp");
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

    $('.coming_soon_button').click(function(event){
        event.preventDefault();
        alert("I'm working on releasing this track soon!");
    })

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