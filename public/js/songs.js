$(document).ready(function() {

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
        $(".container").append("<span>The drag and drop features are comming soon!</span>");
    }
  })

});