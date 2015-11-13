# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ -> $('.datepicker').datetimepicker({format: 'MMMM Do YYYY, h:mm'})

$ -> $("<div id='preview' class='markdown'></div>").insertAfter( $('#content') ).hide()

$ -> $('.preview').click (e) ->
  $(e.target).parent().addClass('active')
  $('.edit a').parent().removeClass('active')
  $("#preview").text "Loading..."
  $('#content').hide()
  $('#preview').show()

  $.post "./preview",
    {body: $('div#content > textarea').val()},
    (data) ->
      $("#preview").html(data)
      true
  false

$ -> $('.edit').click (e) ->
  $(e.target).parent().addClass('active')
  $('.preview a').parent().removeClass('active')
  $('#content').show()
  $('#preview').hide()
  false



$ -> $('textarea[id*=comment]').on "input" , ->
    this.original_height=$(this).height() if !this.original_height
    totalHeight = $(this).prop('scrollHeight') - parseInt($(this).css('padding-top')) - parseInt($(this).css('padding-bottom'))
    $(this).css({'height':totalHeight}) if totalHeight > this.original_height
    

$ -> $('#track-item').on 'click' , ->
  method = $(this).data('method')
  activity_id = $(this).data('id')
  $.ajax
    url: "#{activity_id}/#{method}"
    method: "PATCH"

$ -> $('#participate-item').on 'click', ->
  method = $(this).data('method')
  activity_id = $(this).data('id')
  $.ajax
    url: "#{activity_id}/#{method}"
    method: "PATCH"

$ -> $('#upvotes').on 'click', ->
  activity_id = $(this).data('id')
  $.ajax
    url: "#{activity_id}/upvotes"
    method: "PATCH"
    data:
      id: activity_id

$ -> $('#downvotes').on 'click', ->
  activity_id = $(this).data('id')
  $.ajax
    url: "#{activity_id}/downvotes"
    method: "PATCH"
    data:
      id: activity_id
