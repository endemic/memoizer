###
@description Memory item model
###
define [
	'zepto'
	'backbone'
	'cs!models/item'
	'localstorage'
], ($, Backbone, ItemModel) ->
	class ItemsCollection extends Backbone.Collection
		model: ItemModel
		localStorage: new Backbone.LocalStorage("ItemsCollection")
