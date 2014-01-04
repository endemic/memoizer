###
@description List all memory items
###
define [
	'zepto'
	'backbone'
	'text!templates/items/list.html'
], ($, Backbone, template) ->
	class ListItemView extends Backbone.View

		initialize: ->
			@elem = $(template)
			@render()