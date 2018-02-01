//= require jquery
//= require mediaelement

[].forEach.call(document.querySelectorAll('img[data-src]'),    function(img) {
  img.setAttribute('src', img.getAttribute('data-src'));
  img.onload = function() {
    img.removeAttribute('data-src');
  };
});

$('.episodes h3').click(function(evnt) {
  const $h3 = $(evnt.target);

  if ($h3.hasClass('active')) {
    // deactivate all post episode items and episode sections
    $('h3').removeClass('active');
    $('.episode-body').removeClass('active');
  } else {
    // deactivate all post episode items and episode sections
    $('h3').removeClass('active');
    $('.episode-body').removeClass('active');

    // get elements and data points
    const $mediaPlayerTitle = $('.media-player h3');
    const $mediaPlayerAudio = $('.media-player audio');
    const $h3 = $(evnt.target);
    const episodeId = $h3.data('id');
    const episodeFileUrl = $h3.data('file-src');
    const episodeTitle = $h3.text();
    const $episode = $('.episode-body[data-id="' + episodeId + '"]');

    // activate episode list item and episode section
    $h3.addClass('active');
    $episode.addClass('active');

    // update media player title and file source
    $mediaPlayerTitle.text(episodeTitle)
    $mediaPlayerAudio.attr('src', episodeFileUrl)
  }
});

$('audio').mediaelementplayer({
  success: function(mediaElement, originalNode, instance) {

  }
});
