$(document).on 'click', '.js-clickable-dress-img', (e)->
  e.preventDefault()
  src = $(e.currentTarget).data('src')
  $('.js-big-dress').css('background-image', "url(#{src})")

$(document).on 'click', '.js_to_fitting', (e)->
  console.log 'event fired from application js'
  e.preventDefault()
  $(e.currentTarget).css('opacity', 0)
  id = $(e.currentTarget).data('id')
  image_src = $(e.currentTarget).data('image-src')
  if localStorage['dresses'] && localStorage['dresses'].length > 0
    arr = localStorage['dresses'].split(';').slice(-5)
    arr.push("#{id},#{image_src}")
    localStorage['dresses'] =  arr.join(';')
  else
    localStorage['dresses'] = "#{id},#{image_src}"
  $(e.currentTarget).animate({opacity: 1}, 1500)
