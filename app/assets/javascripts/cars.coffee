@delete_one_car = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()

@del_all_cars = ->
  $('a.remove_car').on 'click', ->
    window.delete_one_car($(this))
    false
  false

@add_new_car = ->
  $('#add_car_link').on 'click', ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_car", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    panel.find('a.remove_car').on 'click', ->
      window.delete_one_car($(this))
      false    
    false

car_ready = ->
  window.add_new_car()
  window.del_all_cars()
$(document).on 'page:load', car_ready # Включаем при ajax обновлении страницы
$(document).ready car_ready # Включаем при обычном обновлении страницы
