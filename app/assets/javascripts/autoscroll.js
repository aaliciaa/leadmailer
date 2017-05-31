/* Homepage, first autoscroll on click */
$(document).ready(function() {
  $('#learn-more').on('click',function (e) {
    e.preventDefault();
    target = $("#scroll-first");
    $('html, body').stop().animate(
      { 'scrollTop': target.offset().top },
      900,
      'swing',
      function () {
      }
    );
  });
});


/* Homepage, second autoscroll on click */
$(document).ready(function() {
  $('#testimonials').on('click',function (e) {
    e.preventDefault();
    target = $("#scroll-second");
    $('html, body').stop().animate(
      { 'scrollTop': target.offset().top },
      900,
      'swing',
      function () {
      }
    );
  });
});
