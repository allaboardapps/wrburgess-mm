//= require jquery
//= require vanilla-lazyload

new LazyLoad();

$('.episodes h3').click(function(evnt) {
  var $h3 = $(evnt.target);

  if ($h3.hasClass('active')) {
    // deactivate all post episode items and episode sections
    $('h3').removeClass('active');
    $('.episode-body').removeClass('active');
  } else {
    // deactivate all post episode items and episode sections
    $('h3').removeClass('active');
    $('.episode-body').removeClass('active');

    // get elements and data points
    var $h3 = $(evnt.target);
    var episodeId = $h3.data('id');
    var $episode = $('.episode-body[data-id="' + episodeId + '"]');

    // activate episode list item and episode section
    $h3.addClass('active');
    $episode.addClass('active');
  }
});
