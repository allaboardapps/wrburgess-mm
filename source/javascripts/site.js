//= require jquery
//= require vanilla-lazyload
//= require highlight

new LazyLoad();

$(document).ready(function() {
  $('pre code').each(function(i, block) {
    hljs.highlightBlock(block);
  });
});
