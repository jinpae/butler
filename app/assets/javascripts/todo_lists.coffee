# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
	$('#todo-lists-section .todo-list-title').fitText(1, { minFontSize: '48px', maxFontSize: '56px' })
