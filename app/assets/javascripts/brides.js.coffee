PopUpShow = ->
  $(".popup_container").show()

PopUpHide = ->
  $(".popup_container").hide()

readUrl = (input)->
  if input.files && (f = input.files[0])
    reader = new FileReader()
    reader.onload = ((theFile) ->
      (e) ->
        dataUrl = e.target.result
        img = document.createElement('img')
        img.src = dataUrl
        width = img.width
        height = img.height
        if width/height >= 126/171
          img.height = 171
          img.width = width*171/height
          style = "margin-left: -#{(img.width - 126)/2}px;"
        else
          img.width = 126
          img.height = height*126/width
          style = "margin-top: -#{(img.height - 171)/2}px;"
        $('.js_upload_image').html(img)
        $('.js_upload_image img').attr('style', style)
    )(f)
    reader.readAsDataURL(f)

checkBrideForm = ->
  $('.new_bride_popup__error').html('')
  name = $('#new_bride_name').val()
  dress = $('#new_bride_dress_name').val()
  file = $('#new_bride_fileupload').val()
  if file && name && dress
    true
  else
    unless file
      $('.new_bride_popup__error').append("Добавьте, пожалуйста, фотографию. <br/>")
    unless dress
      $('.new_bride_popup__error').append("Введите название платья. <br/>")
    unless name
      $('.new_bride_popup__error').append("Введите Ваше имя. <br/>")
    false

$(document).on 'click', '.js_upload_image', (e)->
  e.preventDefault()
  $("#new_bride_fileupload").trigger('click')

$(document).on 'change', '#new_bride_fileupload', (e)->
  readUrl(this)

$(document).on 'click', '.js_add_new_bride', (e)->
  e.preventDefault()
  $('.popup_content').html(JST['brides/new'])
  PopUpShow()
  $( "body" ).scrollTop(10);

$(document).on 'click', '.js_close_popup', (e)->
  e.preventDefault()
  PopUpHide()

$(document).on 'click', '.js_submit_button', (e)->
  e.preventDefault()
  data = new FormData($('form')[0])
  if checkBrideForm()
    $.ajax(
      type: 'POST'
      dataType: 'json'
      url: '/brides'
      enctype: "multipart/form-data"
      data: data
      cache: false
      contentType: false
      processData: false
    ).done (msg)->
      if msg['status'] == 0
        alert 'Не предвиденная ошибка. Пожалуйста, повторите попытку позже.'
    PopUpHide()

