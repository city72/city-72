$(function() {
  $(".js-save").on("click", function() {
    $(".js-save").attr("disabled", "updating").attr("ui-ladda", "updating").attr("data-style", "expand-left");
    $(".js-form").submit();
  });
});