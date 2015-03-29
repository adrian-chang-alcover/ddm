# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('td[data-hook="roles"] button').click ->
    button = this
    $.get($(this).attr('data-url'), ->
      $(button).toggleClass('btn-danger').toggleClass('btn-success')
      $(button).children('i').toggleClass('icon-minus').toggleClass('icon-plus')
    )

$ ->
  $('select#user_faculty_id option').click ->
  	faculty_id = $(this).val()
  	$('select#user_career_id').load("/faculties/careers_for_select?faculty_id=#{faculty_id}")


