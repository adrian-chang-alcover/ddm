# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ (
  -> $('td[data-hook="roles"]').each(
    -> $(this).load('/users/toggle_roles?user='+$(this).attr('data-user-id'))
  )
)

$ (
  -> $('td[data-hook="roles"] button').click(
    -> $(this).parent('td').load($(this).attr('data-url'));
  )
)