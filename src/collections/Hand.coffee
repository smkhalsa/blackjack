class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->

    #if this.minScore() is less than 22
      @add(@deck.pop())
    # else
      # call this.bust

  stand: ->
    # call resolveRound function

  # create bust method
    # call resolveRound function

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  ## set new method score
  bestScore: ->
    # if scores[1] < 22
      # return scores[1]
    # else if scores[0] < 22
      # return scores[0]
    # else return 0
