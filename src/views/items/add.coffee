###
@description Add a new memory item
###
define [
	'zepto'
	'backbone'
	'text!templates/items/add.html'
], ($, Backbone, template) ->
	class AddItemView extends Backbone.View

		initialize: ->
			@elem = $(template)
			@render()