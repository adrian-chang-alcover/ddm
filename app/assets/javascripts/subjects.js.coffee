# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('select#career option').click ->
  	career_id = $(this).val()
  	$('select#subject_discipline_id').load("/careers/disciplines_for_select?career_id=#{career_id}")

$ ->
  $('select#career option').click ->
  	career_id = $(this).val()
  	$('select#subject_semester_id').load("/careers/semesters_for_select?career_id=#{career_id}")