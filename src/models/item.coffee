###
@description Memory item model
###
define [
	'zepto'
	'backbone'
], ($, Backbone) ->
	class ItemModel extends Backbone.Model
		defaults:
			title: 'Memorize this!'
			text: 'lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet'