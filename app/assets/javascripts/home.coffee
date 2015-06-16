# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
	$('.title').fitText(1, { minFontSize: '44px', maxFontSize: '60px' })

	$('.navbar-toggle').on 'click', ->
		$('nav ul').toggleClass 'navbar-collapse-toggle'
