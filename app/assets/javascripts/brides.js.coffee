PopUpShow = ->
  $(".popup_container").show()

PopUpHide = ->
  $(".popup_container").hide()

$(document).on 'click', '.js_add_new_bride', (e)->
  e.preventDefault()
  $('.popup_content').html(JST['brides/new'])
  PopUpShow()

$(document).on 'click', '.js_close_popup', (e)->
  e.preventDefault()
  PopUpHide()
