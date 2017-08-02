//= require ./libs/modernizr-2.6.2.min.js
//= require jquery
//= require jquery_ujs
//= require jquery-ui/widgets/datepicker
//= require jquery-ui/i18n/datepicker-pt-BR
//= require ./libs/jquery.mask.min.js
//= require ./libs/gumby
//= require ./libs/ui/gumby.retina
//= require ./libs/ui/gumby.fixed
//= require ./libs/ui/gumby.skiplink
//= require ./libs/ui/gumby.toggleswitch
//= require ./libs/ui/gumby.radiobtn
//= require ./libs/ui/gumby.tabs
//= require ./libs/ui/gumby.navbar
//= require ./libs/ui/jquery.validation
//= require ./libs/gumby.init
//= require ./plugins.js
//= require ./main.js
//= require ./activable.js
//= require loldesign_publisher/publisher_rails_app.js
//= require vex_plugin/vex.combined.min.js


jQuery(document).ready(function($) {
  new saveBtnManager();
  new formatForm();
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

var formatForm = function(){
  var that    = this;
  this.$form  = $('form');

  this.startup = function(){
    if(!this.$form[0]){ return false; }

    this.$form.find('input.tel').mask("(99) 9?9999-9999");
    this.$form.find('input.cep').mask("99999-999");
    this.$form.find('input.cpf').mask("999.999.999-99");
    this.$form.find('input.cnpj').mask("99.999.999/9999-99");
    this.$form.find('input.hour').mask("99:99");
    this.$form.find('input.date').mask("99/99/9999");
    this.$form.find('.datepicker').datepicker();
  }

  this.startup();
}
