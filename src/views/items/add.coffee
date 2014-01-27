###
@description Add a new memory item
###
define [
	'zepto'
	'backbone'
	'text!templates/items/add.html'
], ($, Backbone, template) ->
	class AddItemView extends Backbone.View
		events:
			'click button.save': 'save'

		initialize: (options) ->
			@items = options.items
			@elem = $(template)
			@render()

		save: ->
			item = @items.create
				title: @$('input.title').val()
				text: @$('textarea.text').val()

			app.navigate "items/#{item.id}", { trigger: true }