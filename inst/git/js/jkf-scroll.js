jQuery(document).ready(function($){
    
$(window).scroll(function() {
  if ($(document).scrollTop() > 5) {
    $('div.slide h1').addClass('shrink');
    $('div.toolbar').addClass('shrink');
  } else {
    $('div.slide h1').removeClass('shrink');
    $('div.toolbar').removeClass('shrink');
  }
  
}).scroll();
});

