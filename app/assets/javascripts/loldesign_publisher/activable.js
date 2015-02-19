jQuery(document).ready(function($) {
  new activableOption();
});

var activableOption = function(){
  var _this    = this;
  this.$links  = $('.activable');

  this.startup = function(){
    if(!this.$links[0]){ return false; }

    this.$links.on('change', function(event) {
      event.preventDefault();

      if($(this).is(':checked')){
        _this.active($(this));
      }else{
        _this.inactive($(this));
      }
    });
  },

  this.active = function($link){
    $.ajax({
      url: '/loldesign_publisher/activables/'+$link.data('resource')+'/'+$link.data('id')+'.json',
      type: 'POST',
      dataType: 'json'
    })
    .done(function() {
      $link.val(true);
    })
    .fail(function() {
      console.log("error");
    });
  },
  this.inactive = function($link){
    $.ajax({
      url: '/loldesign_publisher/activables/'+$link.data('resource')+'/'+$link.data('id')+'.json',
      type: 'DELETE',
      dataType: 'json'
    })
    .done(function() {
      $link.val(false);
    })
    .fail(function() {
      console.log("error");
    });
  },

  this.startup();
}