//= require jquery
//= require mediaelement

$('.post-index li').click(function(evnt) {
  $('.post-index li').removeClass('active');
  $('.post-show .post').removeClass('active');

  const $li = $(evnt.target);
  const postId = $li.data('id');
  const $post = $('.post[data-id="' + postId + '"]');

  $li.addClass('active');
  $post.addClass('active');
});

$('audio').mediaelementplayer({
  success: function(mediaElement, originalNode, instance) {

  }
});
