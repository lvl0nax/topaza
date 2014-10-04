$(document).on 'click', '.js-clickable-dress-img', (e)->
  e.preventDefault()
  src = $(e.currentTarget).data('src')
  $('.js-big-dress').css('background-image', "url(#{src})")

$(document).on 'click', '.js_to_fitting', (e)->
  e.preventDefault()
  localStorage['dresses']='' unless localStorage['dresses']
  $(e.currentTarget).css('opacity', 0)
  id = $(e.currentTarget).data('id')
  image_src = $(e.currentTarget).data('image-src')
  if localStorage['dresses'].length > 3 &&
      parseInt(id) not in get_dresses_ids()
    arr = localStorage['dresses'].split(';').slice(-5)
    arr.push("#{id},#{image_src}")
    localStorage['dresses'] =  arr.join(';')
  else if localStorage['dresses'].length < 2
    localStorage['dresses'] = "#{id},#{image_src}"
  $(e.currentTarget).animate({opacity: 1}, 1500)
  if $('.js_to_selected_dresses')
    update_girl_info(get_dresses_ids())

get_dresses_ids = ->
  tmp = []
  localStorage['dresses'].split(';').forEach (i) ->
    tmp.push parseInt(i)
  tmp

update_girl_info = (ids) ->
  href = '/fittings/selected_dresses?dresses='+ids.join(',');
  $('.js_to_selected_dresses').attr('href', href);
  $('.body__histories__right__girl__count').html(ids.length);
