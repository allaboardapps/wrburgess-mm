//= require jquery
//= require mediaelement

$('.posts h3').click(function(evnt) {
  // deactivate all post list items and post sections
  $('h3').removeClass('active');
  $('.post-body').removeClass('active');

  // get elements and data points
  const $mediaPlayerTitle = $('.media-player h3');
  const $mediaPlayerAudio = $('.media-player audio');
  const $h3 = $(evnt.target);
  const postId = $h3.data('id');
  const postFileUrl = $h3.data('file-src');
  const postTitle = $h3.text();
  const $post = $('.post-body[data-id="' + postId + '"]');

  // activate post list item and post section
  $h3.addClass('active');
  $post.addClass('active');

  // update media player title and file source
  $mediaPlayerTitle.text(postTitle)
  $mediaPlayerAudio.attr('src', postFileUrl)
});

$('audio').mediaelementplayer({
  success: function(mediaElement, originalNode, instance) {

  }
});
