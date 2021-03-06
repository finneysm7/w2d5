class Player
  attr_accessor :hand, :pot, :bankroll
  def initialize
    @bankroll = 100
    @pot = 0
  end
  
  def discard(cards)
    @hand.discard(cards)
  end
  
  def increase_bet(previous_total, new_total)
    raise_amount = new_total - @pot
    raise "You're too poor" if raise_amount > @bankroll
    @pot += raise_amount
    @bankroll -= raise_amount
    new_total
  end
  
  def call_bet(bet)
    call_amount = bet - @pot
    raise "You're too poor" if call_amount > @bankroll
    @pot += call_amount
    @bankroll -= call_amount
    bet
  end
  
  def fold_bet(bet)
    discard(@hand.cards)
    @folded = true
    bet
  end
end