//= require jquery
//= require vanilla-lazyload

var loadDeferredStyles = function() {
  var addStylesNode = document.getElementById("deferred-styles");
  var replacement = document.createElement("div");
  replacement.innerHTML = addStylesNode.textContent;
  document.body.appendChild(replacement)
  addStylesNode.parentElement.removeChild(addStylesNode);
};
var raf = window.requestAnimationFrame || window.mozRequestAnimationFrame ||
  window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;
if (raf) raf(function() { window.setTimeout(loadDeferredStyles, 0); });
else window.addEventListener('load', loadDeferredStyles);

var myLazyLoad = new LazyLoad();

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
    var $mediaPlayerTitle = $('.media-player h3');
    var $mediaPlayerAudio = $('.media-player audio');
    var $h3 = $(evnt.target);
    var episodeId = $h3.data('id');
    var episodeFileUrl = $h3.data('file-src');
    var episodeTitle = $h3.text();
    var $episode = $('.episode-body[data-id="' + episodeId + '"]');

    // activate episode list item and episode section
    $h3.addClass('active');
    $episode.addClass('active');

    // update media player title and file source
    $mediaPlayerTitle.text(episodeTitle)
    $mediaPlayerAudio.attr('src', episodeFileUrl)
  }
});
