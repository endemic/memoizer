###
@description Edit a memory item
###
define [
	'zepto'
	'backbone'
	'text!templates/items/edit.html'
], ($, Backbone, template) ->
	class EditItemView extends Backbone.View

		initialize: ->
			@elem = $(template)
			@render()