$(document).on('turbolinks:load', function(){
  $('#unfollow_btn').hover(function(){
    $(this).removeClass('btn-primary');
    $(this).addClass('btn-danger');
    $(this).text('Unfollow');
  },function(){
    $(this).removeClass('btn-danger');
    $(this).addClass('btn-primary');
    $(this).text('Following');
  });
})
