###
@description Show a memory item
###
define [
	'zepto'
	'backbone'
	'text!templates/items/show.html'
], ($, Backbone, template) ->
	class ShowItemView extends Backbone.View

		initialize: ->
			@elem = $(template)
			@render()