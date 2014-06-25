states = [
  { href: '#tab-before', contentSelector: '.slider-before', anchorSelector: '[href="#tab-before"]' }
  { href: '#tab-during', contentSelector: '.slider-during', anchorSelector: '[href="#tab-during"]' }
  { href: '#tab-after', contentSelector: '.slider-after', anchorSelector: '[href="#tab-after"]' }
]

$(document).ready ->

  $('a.pdf-languages-trigger').click ->
    $(this).toggleClass 'active'
    $('.download-languages').toggleClass 'active'

  hasBefore = $('.basics-slider').hasClass("js-has-before")

  if hasBefore
    window.sliderBefore = $('.slider-before .slider').bxSlider
      infiniteLoop: false,
      responsive: false,
      onSlideBefore: ($slideElement, oldIndex, newIndex) ->
        if newIndex > 0
          $('.slider-before .bx-prev').removeClass 'disabled'
        else
          $('.slider-before .bx-prev').addClass 'disabled'
      onSlideAfter: ($slideElement, oldIndex, newIndex) ->
        sliderBefore.currentIndex = newIndex
  else
    states = [states[1], states[2]]

  window.sliderDuring = $('.slider-during .slider').bxSlider
    infiniteLoop: false,
    responsive: false,
    onSlideBefore: ($slideElement, oldIndex, newIndex) ->
      if !hasBefore
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


  if hasBefore
    $('.slider-before .bx-prev').addClass 'disabled'
  else
    $('.slider-during .bx-prev').addClass 'disabled'



  if hasBefore
    $('.slider-before').find('.bx-next').click (event) ->
      if sliderBefore.currentIndex == sliderBefore.getSlideCount()-1
        window.location.hash = '#tab-during'
        showActive states
      else
        sliderBefore.goToNextSlide()

  $('.slider-during').find('.bx-prev').click (event) ->
    if hasBefore && sliderDuring.currentIndex == 0
      window.location.hash = '#tab-before'
      showActive states
    else
      sliderDuring.goToPrevSlide()

  $('.slider-during').find('.bx-next').click (event) ->
    if sliderDuring.currentIndex == sliderDuring.getSlideCount()-1
      window.location.hash = '#tab-after'
      showActive states
    else
      sliderDuring.goToNextSlide()

  $('.slider-after').find('.bx-prev').click (event) ->
    if sliderAfter.currentIndex == 0
      window.location.hash = '#tab-during'
      showActive states
    else
      sliderAfter.goToPrevSlide()

  if hasBefore
    duringIndex = 1
    beforeIndex = 2
  else
    duringIndex = 0
    beforeIndex = 1

  if hasBefore && window.location.hash == states[0].href
    $('.slider-during').hide()
    $('.slider-after').hide()
  else if window.location.hash == states[duringIndex].href
    $('.slider-before').hide()
    $('.slider-after').hide()
  else if window.location.hash == states[beforeIndex].href
    $('.slider-before').hide()
    $('.slider-during').hide()

  showActive states

window.onhashchange = -> showActive states