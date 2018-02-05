//= require jquery
//= require vanilla-lazyload
//= require highlight

new LazyLoad();

$(document).ready(function() {
  $('code').each(function(i, block) {
    hljs.highlightBlock(block);
  });
});
