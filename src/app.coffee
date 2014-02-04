###
@description App controller; handles instantiating scenes, music, sfx
###
define [
	'zepto'
	'underscore'
	'backbone'
	'cs!views/items/list'
	'cs!views/items/show'
	'cs!views/items/add'
	'cs!views/items/edit'
	'cs!collections/items'
	'cs!models/item'
	'cs!data/verses'
	'less'
	'localstorage'
], ($, _, Backbone, ListItemsView, ShowItemView, AddItemView, EditItemView, ItemsCollection, ItemModel, verses) ->

	# Extend local storage
	Storage.prototype.setObject = (key, value) ->
	    @setItem key, JSON.stringify value

	Storage.prototype.getObject = (key) ->
    	value = @getItem key
	    return value and JSON.parse value

	Backbone.View.prototype.render = ->
		@$el.html @elem
		return @

	Backbone.View.prototype.close = ->
		@elem.remove()
		@undelegateEvents()
		@onClose() if typeof @onClose == "function"

	# Define app object
	class App extends Backbone.Router
		routes:
			'': 'listItems'
			'items': 'listItems'
			'items/add': 'addItem'
			'items/:id': 'showItem'
			'items/:id/edit': 'editItem'
			'items/:id/destroy': 'destroyItem'

		initialize: ->
			@el = $('#app')
			@items = new ItemsCollection
			@items.fetch()

			# Add some sample data the first time the app is loaded
			if @items.length is 0
				for verse in verses
					@items.create verse

			@active = null

		listItems: ->
			@active.close() if @active != null
			@active = new ListItemsView
				el: @el
				items: @items

		addItem: ->
			@active.close() if @active != null
			@active = new AddItemView
				el: @el
				items: @items

		showItem: (id)->
			@active.close() if @active != null
			@active = new ShowItemView
				el: @el
				items: @items
				id: id

		editItem: (id)->
			@active.close() if @active != null
			@active = new EditItemView
				el: @el
				items: @items
				id: id

		destroyItem: (id)->
			@items.get(id).destroy()
			app.navigate 'items', { trigger: true }
			alert 'Item destroyed!'

	# Load the app
	window.app = new App
	Backbone.history.start()

