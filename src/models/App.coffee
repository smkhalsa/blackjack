# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'roundResult', ''

    @get('playerHand').on 'resolve', @resolveRound, @
    @get('dealerHand').on 'resolve', @resolveRound, @
  # create resolveRound function that plays out game upon player bust or stand
  resolveRound: ->
    # flip dealer's first card
    @get('dealerHand').models[0].flip()
    console.log 'should have flipped'
    # while dealerHand.bestScore <17 || dealerHand.bestScore < playerHand.bestScore, dealer hit
    @get('dealerHand').hit() while @get('dealerHand').bestScore() !=0 and (@get('dealerHand').bestScore() < 17 or @get('dealerHand').bestScore() < @get('playerHand').bestScore())
    # if player's score is equal to dealer score set this.roundResult to tie
    if @get('dealerHand').bestScore() == @get('playerHand').bestScore()
      @set 'roundResult', 'tie'
    # else if player's score is < dealer's score set this.roundResult to lose
    else if @get('dealerHand').bestScore() > @get('playerHand').bestScore()
      @set 'roundResult', 'lose'
    # else set this.roundResult to win
    else
      @set 'roundResult', 'win'
