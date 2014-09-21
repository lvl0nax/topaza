$(document).on 'click', '.js-clickable-dress-img', (e)->
  e.preventDefault()
  src = $(e.currentTarget).data('src')
  $('.js-big-dress').css('background-image', "url(#{src})")
