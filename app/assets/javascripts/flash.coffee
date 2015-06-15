$(document).on 'page:change', ->
	$('#flash-wrap').css 'right', flashDivWidth

	setTimeout ->
		$('#flash-wrap').css 'visibility', 'visible'
		$('#flash-wrap').css 'right', 0
	, 500

	setTimeout ->
		$('#flash-wrap').css 'right', flashDivWidth
		$('#flash-wrap').fadeOut 'slow', ->
			$(this).remove()
	, 4000

	$('.close-btn').click ->
		$('#flash-wrap').fadeOut 'slow', ->
			$('#flash-wrap').off()
			$('#flash-wrap').remove()

flashDivWidth = ->
	-($('#flash-wrap').width() +
	parseFloat($('#flash-wrap').css('padding-right')) +
	parseFloat($('#flash-wrap').css('padding-left'))) + 'px'
