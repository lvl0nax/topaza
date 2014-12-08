$(document).on 'click', '.js_dress_to_remove', (e)->
  e.preventDefault()
  id = $(e.currentTarget).data('id')
  arr = []
  localStorage['dresses'].split(';').forEach (i) ->
    if (parseInt(i) != parseInt(id)) && (i.length > 3)
      arr.push(i)
  localStorage['dresses'] = arr.join(';')
  $(e.currentTarget).parents('.js_dress').remove()

$(document).on 'click', '.js_time_select', (e)->
  e.preventDefault()
  unless $(e.currentTarget).hasClass('disabled_time')
    $('.js_time_text').text($(e.currentTarget).data('time'))
    $('.js_date_text').text($(".fitting_content__date_select__calendar").val())
    $('.active_time').removeClass('active_time')
    $(e.currentTarget).addClass('active_time')

$(document).on 'click', 'a.ui-state-default', (e)->
  e.preventDefault()
  check_available_time()

$(document).on 'click', '.js_fitting_submit', (e)->
  e.preventDefault()
  time = $('.active_time').data('time')
  date = $(".fitting_content__date_select__calendar").val()
  name = $('#fitting_name').val()
  phone = $('#fitting_phone').val()
  ids = []
  if localStorage['dresses']?
    localStorage['dresses'].split(';').forEach (i) ->
      ids.push(parseInt(i)) if i.length > 0

  if validate_fitting(time, name, phone, ids)
    $.ajax(
      type: 'post'
      dataType: "json"
      url: '/fittings'
      data: {
        try_time: time
        try_date: date
        name: name
        phone: phone
        ids: ids
      }
    ).done (data)->
      localStorage['dresses'] = ''
      window.location = data.path

validate_fitting = (time, name, phone, ids) ->
  checkbox = $('input:checked')
  flag = true
  errors = $('.fitting-content__submit_block__errors')
  errors.html('')
  unless time
    flag = false
    errors.append('<div>Выберите желаемое время.</div>')
  unless name
    flag = false
    errors.append('<div>Введите имя.</div>')
  unless phone
    flag = false
    errors.append('<div>Введите телефон.</div>')
  #if ids.length == 0 && checkbox.length > 0
  #  flag = false
  #  errors.append('<div>Добавте платья на примерку.</div>')
  flag

check_available_time = ()->
  $('.disabled_time').removeClass('disabled_time')
  date = $(".fitting_content__date_select__calendar").val()
  $.ajax(
    type: 'get'
    dataType: "json"
    url: "/fittings/disabled_times"
    data: {
      date: date
    }
  ).done (data)->
    if '13:00' in data.disabled_times
      $('[data-time="13:00"]').addClass('disabled_time')
    if '15:00' in data.disabled_times
      $('[data-time="15:00"]').addClass('disabled_time')
    if '17:00' in data.disabled_times
      $('[data-time="17:00"]').addClass('disabled_time')

get_dresses = ->
  $(".fitting_content__dress_list").html ""
  if localStorage["dresses"].length > 1
    localStorage["dresses"].split(";").forEach((i) ->
      if i.length > 1
        $(".fitting_content__dress_list").append(JST["fittings/dress"](
          id: i.split(",")[0]
          image_src: i.split(",")[1]
        ))
    )
