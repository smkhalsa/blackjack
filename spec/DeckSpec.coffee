assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit().last()
      assert.strictEqual deck.length, 49

  describe 'bestScore', ->
    it 'if player scores above 21, player bestScore should yield 0', ->
      hand.hit()
      hand.hit()
      hand.hit()
      hand.hit()
      hand.hit()
      hand.hit()
      hand.hit()
      hand.hit()
      hand.hit()
      assert.strictEqual hand.bestScore(), 0

