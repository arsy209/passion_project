$(document).ready(function() {
 $("body").on("click", "#signup", function(event){
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      type: "GET",
      url: "/signup",
    }).done(function(response){
      $(".container").replaceWith(response);
    })
  })

  $("body").on("click", "#login", function(event){
    event.preventDefault();
    $target = $(event.target);
    $.ajax({
      type: "GET",
      url: "/login",
    }).done(function(response){
      $(".container").replaceWith(response);
    })
  })
  $( ".playlist").hover(
  function(event) {
    $target = $(event.target);
    $target.children().show()
  })

$( ".playlist" ).mouseleave(
  function() {
    $(".song").hide()
  })

$("a.edit_link").click(function(event){
  event.preventDefault();
  $target = $(event.target);
  $target.hide();
  $(".edit_form").show();

})


$(".edit_form").on("submit", function(event){
  event.preventDefault();
  $target = $(event.target);
  $.ajax({
     url: $target.attr("action"),
     type: "PUT",
     data: $target.serialize()
  }).done(function(response){
    $("html").html(response)
  })
})

  $('.song').draggable();
  $('.playlist').droppable({
      drop: function( event) {
        $(".container").append("");
    }
  })

});
