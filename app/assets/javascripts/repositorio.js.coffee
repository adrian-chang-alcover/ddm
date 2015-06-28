# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('div#repo a.directory').click ->
		$(this).next().slideToggle()
		return false

$ ->
	$('a.new, :header.new').append(' <span class="badge">nuevo</span>')
	