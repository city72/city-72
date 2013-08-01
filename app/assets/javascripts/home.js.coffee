$.get window.location.origin + "/em", (response) ->
  if response.em_mode
    window.location = window.location.origin + "/em/home";

$(document).ready ->
  $('.slider-during .slider').bxSlider
    infiniteLoop: false,
    hideControlOnEnd: true
  $('.slider-after .slider').bxSlider
    infiniteLoop: false,
    hideControlOnEnd: true

states = [
  { href: '#tab-during-earth-quake', contentSelector: '.slider-during', anchorSelector: '[href="#tab-during-earth-quake"]' }
  { href: '#tab-after-earth-quake', contentSelector: '.slider-after', anchorSelector: '[href="#tab-after-earth-quake"]' }
]

showActive states

window.onhashchange = -> showActive states