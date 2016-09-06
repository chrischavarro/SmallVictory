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
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets


$(document).ready(function(){
    $('#calendar').datepicker({
        inline: true,
        firstDay: 1,
        showOtherMonths: true,
        dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
    });

	 $('.wakeup_time_select').TimePickerAlone({
	    inputFormat: 'HH:mm',
	    hours: true,
	    minutes: true,
	    seconds: false,
	    ampm: true
	  });
	  window.onerror = function (m){
	  alert(m)
	  }

    $('.victor').click(function(){
    	$('.victor').toggleClass("animated bounce")
    });

    $('.profile_dropdown').click(function(){
    	$('#modal').modal('show');
    })

    $( function() {
    	$( "#menu" ).menu();
  } );
});
