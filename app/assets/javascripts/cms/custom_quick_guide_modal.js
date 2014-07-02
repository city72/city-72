$(function() {

  $.modal.defaults = {
    overlay: "#000",        // Overlay color
    opacity: 0.75,          // Overlay opacity
    zIndex: 1,              // Overlay z-index.
    escapeClose: true,      // Allows the user to close the modal by pressing `ESC`
    clickClose: true,       // Allows the user to close the modal by clicking the overlay
    closeText: 'Confirm',   // Text content for the close <a> tag.
    closeClass: 'close-trigger',         // Add additional class(es) to the close <a> tag.
    showClose: true,        // Shows a (X) icon/link in the top-right corner
    modalClass: "modal",    // CSS class added to the element being displayed in the modal.
    spinnerHtml: null,      // HTML appended to the default spinner during AJAX requests.
    showSpinner: false,      // Enable/disable the default spinner during AJAX requests.
    fadeDuration: 200,     // Number of milliseconds the fade transition takes (null means no transition)
    fadeDelay: 1.0          // Point during the overlay's fade-in that the modal begins to fade in (.5 = 50%, 1.5 = 150%, etc.)
  };

  $(".js-custom-quick-guide").click(function(event) {
    event.preventDefault();
    var modal = $(".modal-container");
    modal.modal();
    modal.removeClass("hidden");
  });

  $(".modal-container").on($.modal.CLOSE, function(event, modal) {
    $(".modal-container").removeClass("hidden");
    $(".js-custom-quick-guide-name").text($("#quick_guide_title").val());
  });
});