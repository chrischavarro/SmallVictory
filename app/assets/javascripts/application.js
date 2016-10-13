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


    // DASHBOARD CHARTS
// DOUGHNUT
var doughnut_all_labels_array = []
var doughnut_all_data_array = []
var start_date = moment().subtract(30, 'days').format();
var request = $.get("/api/doughnut_chart_data/" + start_date,
    function(data) {
        // console.log(data)
        Object.keys(data).forEach(function(label) {
            doughnut_all_labels_array.push(label);
            doughnut_all_data_array.push(data[label]);
        })
        drawDoughnutChart(doughnut_all_labels_array, doughnut_all_data_array)
    });

function drawDoughnutChart(labels, data){
    var doughnut_chart_target = $("#js_doughnut_chart");
     doughnutChart = new Chart(doughnut_chart_target, {
        type: 'doughnut',
        data: {
            labels: labels,
            datasets: [{
                label: "Test",
                data: data,
                backgroundColor: [
                        "rgba(255, 99, 132, 1)",
                        "rgba(54, 162, 235, 1)",
                        "rgba(255, 206, 86, 1)",
                        "rgba(38, 166, 154, 0.7)",
                        "rgba(12, 52, 251, 0.7)",
                        "rgba(96, 55, 169, 0.7)",
                        "rgba(255, 132, 8, 0.7)"
                ]
            }]
        }
    });
}

// RADAR

var radar_all_attempted_labels_array = []
var radar_all_attempted_data_array = []
var radar_all_completed_labels_array = []
var radar_all_completed_data_array = []
var start_date = moment().subtract(30, 'days').format();
var request = $.get("/api/radar_chart_data/" + start_date,
    function(data) {
        Object.keys(data[0]).forEach(function(label){
            radar_all_attempted_labels_array.push(label);
            radar_all_attempted_data_array.push(data[0][label]);
        })
        Object.keys(data[1]).forEach(function(label){
            radar_all_completed_labels_array.push(label);
            radar_all_completed_data_array.push(data[1][label]);
        })
        drawRadarChart(radar_all_attempted_labels_array, radar_all_attempted_data_array, radar_all_completed_labels_array, radar_all_completed_data_array)
    });

        var radarOptions = {
          scale: {
            ticks: {
              beginAtZero: true,
              stepSize: 1
            }
          }
        }

function drawRadarChart(attempted_labels, attempted_data, completed_labels, completed_data){
    var radar_chart_target = $("#js_radar_chart");
     radarChart = new Chart(radar_chart_target, {
        type: 'radar',
            data: {
              labels: attempted_labels, 
              datasets: [
                {
                  label: "Completed",
                  data: completed_data,
                  backgroundColor: 
                    "rgba(38, 166, 154, 0.7)" 
                },
                {
                  label: "Attempted",
                  data: attempted_data,
                  backgroundColor:
                    "rgba(255, 206, 86, 0.7)"
                }
              ]
            },
            options: radarOptions
    });
}

// BAR

var bar_all_labels_array = []
var bar_all_data_array = []
var start_date = moment().subtract(30, 'days').format();
var request = $.get("/api/line_chart_data/" + start_date,
    function(data) {
        // console.log(data)
        Object.keys(data).forEach(function(label) {
            bar_all_labels_array.push(label);
            bar_all_data_array.push(data[label]);
        })
        drawBarChart(bar_all_labels_array, bar_all_data_array)
    });

function drawBarChart(labels, data){
    var bar_chart_target = $("#js_bar_chart");
     barChart = new Chart(bar_chart_target, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                data: data,
                backgroundColor: [
                        "rgba(255, 99, 132, 0.7)",
                        "rgba(54, 162, 235, 0.7)",
                        "rgba(255, 206, 86, 0.7)",
                        "rgba(38, 166, 154, 0.7)",
                        "rgba(12, 52, 251, 0.7)",
                        "rgba(96, 55, 169, 0.7)",
                        "rgba(255, 132, 8, 0.7)"
                ]
            }]
        },
        options: {
            legend: {
                display: false
            }
        }
    });
}



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