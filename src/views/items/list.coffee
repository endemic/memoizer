###
@description List all memory items
###
define [
	'zepto'
	'backbone'
	'text!templates/items/list.html'
], ($, Backbone, template) ->
	class ListItemView extends Backbone.View

		initialize: (options)->
			compiled = _.template template
			@elem = $(compiled({ items: options.items }))
			@render()