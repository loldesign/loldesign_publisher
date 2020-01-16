jQuery(document).ready(function($) {
  // FAQ DROP LIST //
  $(".nav-link.collapsed").click(function() {
    $(this).closest('.nav-item').find(".nav-item.collapsable").slideToggle('.hide');
    $(this).toggleClass('rotate-arrow');
  });
});