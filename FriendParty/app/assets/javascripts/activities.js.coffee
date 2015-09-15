# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ -> $('.datepicker').datetimepicker({format: 'MMMM Do YYYY, h:mm'})

$ -> $("<div id='preview' class='markdown form-control'></div>").insertAfter( $('#page_body') )

$ -> $('.preview').click (e) ->
  $(e.target).parent().addClass('active')
  $('.edit a').parent().removeClass('active')
  $("#preview").text "Loading..."
  $('#page_body').hide()
  $('#preview').show()

  $.post "./preview",
    {body: '`name`'},
    (data) ->
      $(".preview").html data.body
     false
    false
