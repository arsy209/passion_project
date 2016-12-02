$(document).ready(function() {

$( ".playlist").hover(
  function(event) {
    $target = $(event.target);
    $target.children().show()
  })

$( ".playlist" ).mouseleave(
  function() {
    $(".song").hide()
  })

});
