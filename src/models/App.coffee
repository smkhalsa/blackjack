# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  # create resolveRound function that plays out game upon player bust or stand
  resolveRound: ->
    # reveal dealer card
    # while dealerHand.bestScore <17 && < playerHand.bestScore
      # dealer hit
    # if player's score is equal to dealer score
      # set this.roundResult to tie
    # else if player's score is < dealer's score
      # set this.roundResult to lose
    # else
      # set this.roundResult to win
    # alert this.roundResult
