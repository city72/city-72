$(function() {

  $(".js-custom-quick-guide").click(function(event) {
    event.preventDefault();
    $(".modal-container").modal("show");
  });

  $(".modal-container").on('hidden.bs.modal', function(e) {
    $(".js-custom-quick-guide-name").text($("#quick_guide_title").val());
    $(".js-update-message").removeClass("hidden");
  });
});