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
	'cs!models/item',
	'less'
], ($, _, Backbone, ListItemsView, ShowItemView, AddItemView, EditItemView, ItemsCollection, ItemModel) ->
	
	# Extend local storage
	Storage.prototype.setObject = (key, value) ->
	    @setItem key, JSON.stringify value

	Storage.prototype.getObject = (key) ->
    	value = @getItem key
	    return value and JSON.parse value

	# Define app object
	class App extends Backbone.Router
		routes: 
			'': 			  	 'listItems'
			'new': 			  	 'newItem'
			'items': 		  	 'listItems'
			'items/:id': 	  	 'showItem'
			'items/:id/edit': 	 'editItem'
			'items/:id/destroy': 'destroyItem'

		initialize: ->
			@el = $('#app')

			$('body').on 'touchmove', (e) ->
				e.preventDefault()

		listItems: ->
			console.log 'listItems'

		newItem: ->
			console.log 'newItem'
		
		showItem: ->
			console.log 'showItem'

		editItem: ->
			console.log 'editItem'

		destroyItem: ->
			console.log 'destroyItem'

	# Load the app
	window.app = new App
	Backbone.history.start()
	