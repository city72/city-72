$(function() {
  Ladda.bind( '.js-save' );
  $(".js-save").on("click", function() {
    $(".js-save").attr("disabled", "updating").attr("data-style", "expand-left");
    $(".js-form").submit();
  });
});