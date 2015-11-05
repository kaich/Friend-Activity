# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ -> $("#likeable").on 'click' , (e) ->
  $el = $(e.currentTarget)
  likeable_id = $el.data("id")
  likeable_type = $el.data("type")
  likeable_method =$el.data("method")
  if likeable_method == "post"
    $.post "/likes" ,{type: likeable_type,id: likeable_id}
  else
    $.ajax
      url: "/likes"
      method: "DELETE"
      data: {type: likeable_type,id:likeable_id}
  false

