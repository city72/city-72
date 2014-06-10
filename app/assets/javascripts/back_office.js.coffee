//= require jquery
//= require bootstrap.js

$(document).ready ->

  $(".include-field").change ->
    $(this).nextAll(".list-element:first").toggleClass "inactive", @checked
    return