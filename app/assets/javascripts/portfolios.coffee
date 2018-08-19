# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
apply_sortable = undefined
set_positions = undefined


set_positions = ->
  $('.ui-sortable-handle').each (i) ->
    $(this).attr 'data-pos', i + 1
    return
  return


apply_sortable = ->
  set_positions()
  $('.sortable').sortable()
  $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
    updated_order = []
    set_positions()
    $('.ui-sortable-handle').each (i) ->
      updated_order.push
        id: $(this).data('id')
        position: i + 1
      return
    $.ajax
      type: 'PUT'
      url: 'portfolios/sort'
      data: order: updated_order
    return
  return

$(document).ready apply_sortable