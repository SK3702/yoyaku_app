$(document).on('turbolinks:load', function(){
    $('.header-user-name').click(function() {
      $('.btn-down-menu').addClass('add-hidden');
    });
});

$(document).click(function(e){
  if(!$(e.target).closest('.header-user-name').length){
    $('.btn-down-menu').removeClass('add-hidden');
    }
});