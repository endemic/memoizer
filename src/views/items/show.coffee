###
@description Show a memory item
###
define [
	'zepto'
	'backbone'
	'text!templates/items/show.html'
], ($, Backbone, template) ->
	class ShowItemView extends Backbone.View
		events:
			'click .text > span': (e) -> $(e.target).toggleClass 'blackout'

		initialize: (options) ->
			compiled = _.template template
			@elem = $(compiled({ item: options.items.get(options.id) }))

			text = $('.text', @elem).text().split(' ')

			text.forEach (value, index) ->
				text[index] = "<span>#{value}</span>"
			
			$('.text', @elem).html text.join(' ')
			@render()
