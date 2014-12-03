//= require jquery
//= require jquery_ujs
//= require modernizr
//= require ./libs/gumby
//= require ./libs/ui/gumby.retina
//= require ./libs/ui/gumby.fixed
//= require ./libs/ui/gumby.skiplink
//= require ./libs/ui/gumby.toggleswitch
//= require ./libs/ui/gumby.checkbox
//= require ./libs/ui/gumby.radiobtn
//= require ./libs/ui/gumby.tabs
//= require ./libs/ui/gumby.navbar
//= require ./libs/ui/jquery.validation
//= require ./libs/gumby.init
//= require ./plugins.js
//= require ./main.js

jQuery(document).ready(function($) {
  new saveBtnManager();
});

var saveBtnManager = function(){
  var _this       = this;
  this.$container = $('.btn.save');

  this.startup = function(){
    if(!this.$container[0]){ return false; }
    
    this.$container.on('click', 'a', function(event) {
      event.preventDefault();
      
      _this.submitForm();
    });
  },

  this.submitForm = function(){
    $('form').submit();
  }

  this.startup();
}