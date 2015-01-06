# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ (
  -> $('select#ppd_career option').click(
    -> document.location.search = "?career=" + $(this).val()
  )
)

$ (
  -> $('select#ppd_career').val($('#career_id').val())
)