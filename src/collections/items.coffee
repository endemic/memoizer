###
@description Memory item model
###
define [
	'zepto'
	'backbone'
	'cs!models/item'
], ($, Backbone, ItemModel) ->
	class ItemsCollection extends Backbone.Collection
		model: ItemModel