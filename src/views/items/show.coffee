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

			@items = options.items
			item = @items.get(options.id)

			# Handle getting "previous/next" items to link against
			previousIndex = @items.indexOf(item) - 1
			nextIndex = @items.indexOf(item) + 1

			if previousIndex == -1 then previousIndex = @items.length - 1
			if nextIndex == @items.length then nextIndex = 0

			previousItem = @items.at previousIndex
			nextItem = @items.at nextIndex

			@elem = $(compiled({ item: item, previous: previousItem, next: nextItem }))

			text = $('.text', @elem).text().split(' ')

			text.forEach (value, index) ->
				text[index] = "<span>#{value}</span>"
			
			$('.text', @elem).html text.join(' ')
			@render()
