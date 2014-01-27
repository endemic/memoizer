###
@description Edit a memory item
###
define [
	'zepto'
	'backbone'
	'text!templates/items/edit.html'
], ($, Backbone, template) ->
	class EditItemView extends Backbone.View
		events:
			'click button.save': 'save'

		initialize: (options) ->
			compiled = _.template template
			@item = options.items.get options.id
			@elem = $(compiled({ item: @item }))
			@render()

		save: ->
			@item.save
				title: @$('input.title').val()
				text: @$('textarea.text').val()

			app.navigate "items/#{@item.id}", { trigger: true }
			alert 'Item saved!'