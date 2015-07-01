# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('div#repo a.directory').click ->
		$(this).next().slideToggle()
		$(this).children().children('span.glyphicon').toggleClass('glyphicon-minus').toggleClass('glyphicon-plus')
		return false

#$ ->
#	$('div#repo a.file.new, div#repo :header.new').append(' <span class="badge">nuevo</span>')