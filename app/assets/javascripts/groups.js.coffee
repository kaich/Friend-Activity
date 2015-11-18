# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ -> $("#favoritable").on 'click' , (e) ->
  $el = $(e.currentTarget)
  favoritable_id = $el.data("id")
  favoritable_type = $el.data("type")
  favoritable_method =$el.data("method")
  if favoritable_method == "post"
    $.post "/favorites" ,{type: favoritable_type,id: favoritable_id}
  else
    $.ajax
      url: "/favorites"
      method: "DELETE"
      data: {type: favoritable_type,id:favoritable_id}
  false

