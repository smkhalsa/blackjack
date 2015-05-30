class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    console.log 'it rendered'
    @$el.css "background-image", "url(img/cards/#{@model.get('fileName')})"
    @$el.css "background-image", "url(img/card-back.png)" unless @model.get 'revealed'

