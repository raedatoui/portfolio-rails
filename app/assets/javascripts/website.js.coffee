# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  # putpixel = (ix, iy, rd, gr, bl, al) ->
  #   p = (yr * iy + ix) * 4
  #   pix[p] = rd % 256 # red
  #   pix[p + 1] = gr % 256 # green
  #   pix[p + 2] = bl % 256 # blue
  #   pix[p + 3] = al % 256 # alpha

  # getpixel = (ix, iy) ->
  #   p = (yr * iy + ix) * 4
  #   rd = pix[p] # red
  #   gr = pix[p + 1] # green
  #   bl = pix[p + 2] # blue
  #   al = pix[p + 3] # alpha

  # canvas = document.getElementById("canvas")
  # context = canvas.getContext("2d")
  # xr = context.canvas.width
  # yr = context.canvas.height
  # imgd = context.createImageData(xr, yr)
  # pix = imgd.data
  # rd = 0
  # gr = 0
  # bl = 0
  # al = 0

  # # seed
  # rd0 = Math.floor(Math.random() * 128) + 1
  # gr0 = Math.floor(Math.random() * 128) + 1
  # bl0 = Math.floor(Math.random() * 128) + 1
  # putpixel xr - 1, 0, rd0, gr0, bl0, 255
  # rd1 = 0
  # gr1 = 0
  # bl1 = 0
  # ky = 1

  # while ky < yr - 1
  #   kx = 0

  #   while kx < xr - 1
  #     getpixel kx, ky - 1
  #     rd1 = rd
  #     gr1 = gr
  #     bl1 = bl
  #     getpixel kx + 1, ky - 1
  #     # XOR
  #     putpixel kx, ky, rd0, bl0, gr0, 255  if (rd1 is 0 and rd > 0) or (rd1 > 0 and rd is 0)
  #     kx++
  #   ky++

  # context.putImageData imgd, 0, 0
  # console.log imgd
  counter = 0
  TweenLite.to($('.onoffswitch'), 2, {opacity:1, delay:1})

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
            console.log parseInt($(this).data("slide-width"))
            if $(this).children().length
              $(this).bxSlider
                video: true
                adaptiveHeight: true
                controls: true
                pager: false
                # slideWidth: parseInt($(this).data("slide-width"))
                slideMargin: 10
                responsive: true
                # minSlides: 2
                # maxSlides: 3
        , 250

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
