# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('body').flowtype
   fontRatio : 30,
   lineRatio : 1.45
   minFont   : 12
   maxFont   : 40
   maximum   : 1200

  counter = 0
  # TweenLite.to($('.onoffswitch'), 2, {opacity:1, delay:1})

  $(".slider").each (index) ->
    console.log $(this).attr("id"), parseInt($(this).data("slide-width"))
    if $(this).children().length
      $(this).bxSlider
        video: true
        adaptiveHeight: true
        controls: true
        pager: false
        slideWidth: parseInt($(this).data("slide-width"))
        slideMargin: 10
        responsive: false
        minSlides: 2
        maxSlides: 3

  $( "#main-swtich").change (e) ->
    if $("#main-swtich").is(':checked')
      TweenLite.to $("#main"), 2,
        opacity: 0
        onComplete: ->
          $("#main").css('display','none')
          canvas = document.getElementById("canvas")
          ctx = canvas.getContext("2d")
          ctx.drawImage(document.getElementById("hara"), 0, 0,2000,1312,0,0,2000,1312)
          $('#hara').css('display', 'none')
          imageData = ctx.getImageData(0, 0, 2000, 1312);
          pixels = imageData.data;
          numPixels = pixels.length;
          pixels2 = new Uint8ClampedArray(pixels);
          pixels2 = shuffle(pixels2);
          f = setInterval ->
            i = counter
            while i < counter+5000
              j = Math.floor(Math.random()*numPixels)
              pixels[j] = pixels2[j]
              pixels2[j*4] = 255-pixels2[j*4]
              i++
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            ctx.putImageData(imageData, 0, 0);
            counter = counter + 5000
            if counter > pixels.length
              clearInterval f
              console.log "done"
          , 10

          #
          # imageData2.data = pixels2;


    else
      TweenLite.to($('#hara'), 2, {opacity:0})
      $("#main").css('display','block')
      TweenLite.to $("#main"), 1,
        opacity: 1

  $('section .header').on 'click', (e) ->
    e.preventDefault()
    section = $(this).parent()

    if !section.hasClass('on')

      ga('send', 'event', 'button', 'click', section.attr("data-slug"));

      $.ajax
        type: 'GET'
        url: "/posts/#{$(this).parent().attr("data-id")}.js"
        dataType : 'html'
        error: (jqXHR, textStatus, errorThrown) ->
          console.log("wow")
        success: (data, textStatus, jqXHR) =>
          $('section.on').find('.content').remove()
          $('section.on').removeClass('on')
          section.find('hr').before(data)
          section.addClass('on')
          $('html, body').animate
            scrollTop: section.offset().top - $('header').height()
          setTimeout   =>
            section.find('.slider').each (index) ->

              if $(this).children().length
                $(this).bxSlider
                  video: true
                  adaptiveHeight: true
                  controls: true
                  pager: false
                  slideWidth: parseInt($(this).data("slide-width"))
                  slideMargin: 10
                  responsive: true
                  # minSlides: 2
                  # maxSlides: 3
          , 250
    else
      $('section.on').find('.content').remove()
      $('section.on').removeClass('on')

  $(".contacts li a").on "click" , (e)->
    ga('send', 'event', 'button', 'click', $(this).parent().attr("data-slug"));

shuffle = (array) ->
  counter = array.length
  temp = undefined
  index = undefined

  # While there are elements in the array
  while counter > 0

    # Pick a random index
    index = Math.floor(Math.random() * counter)

    # Decrease counter by 1
    counter--

    # And swap the last element with it
    temp = array[counter]
    array[counter] = array[index]
    array[index] = temp
  array
