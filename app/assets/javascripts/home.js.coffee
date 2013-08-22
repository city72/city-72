states = [
  { href: '#tab-during-earth-quake', contentSelector: '.slider-during', anchorSelector: '[href="#tab-during-earth-quake"]' }
  { href: '#tab-after-earth-quake', contentSelector: '.slider-after', anchorSelector: '[href="#tab-after-earth-quake"]' }
]

$(document).ready ->
  window.sliderDuring = $('.slider-during .slider').bxSlider
    infiniteLoop: false,
    responsive: false,
    onSlideBefore: ($slideElement, oldIndex, newIndex) ->
      if newIndex > 0
        $('.slider-during .bx-prev').removeClass 'disabled'
      else
        $('.slider-during .bx-prev').addClass 'disabled'
    onSlideAfter: ($slideElement, oldIndex, newIndex) ->
      sliderDuring.currentIndex = newIndex

  window.sliderAfter = $('.slider-after .slider').bxSlider
    infiniteLoop: false,
    responsive: false,
    onSlideBefore: ($slideElement, oldIndex, newIndex) ->
      if newIndex == sliderAfter.getSlideCount()-1
        $('.slider-after .bx-next').addClass 'disabled'
      else
        $('.slider-after .bx-next').removeClass 'disabled'
    onSlideAfter: ($slideElement, oldIndex, newIndex) ->
      sliderAfter.currentIndex = newIndex

  $('.slider-during .bx-prev').addClass 'disabled'

  $('.slider-during').find('.bx-next').click (event) ->
    if sliderDuring.currentIndex == sliderDuring.getSlideCount()-1
      window.location.hash = '#tab-after-earth-quake'
      showActive states
    else
      sliderDuring.goToNextSlide()

  $('.slider-after').find('.bx-prev').click (event) ->
    console.log 'slider-after prev' + sliderAfter.getCurrentSlide()
    if sliderAfter.currentIndex == 0
      window.location.hash = '#tab-during-earth-quake'
      showActive states
    else
      sliderAfter.goToPrevSlide()

  if window.location.hash == states[0].href
    $('.slider-after').hide()
  else
    $('.slider-during').hide()
  showActive states

window.onhashchange = -> showActive states