require './item'

class Game < Item
  attr_accessor :mulitiplayer, :last_played_at

  def initialize(mulitiplayer, last_played_at, *args)
    @mulitiplayer = mulitiplayer
    @last_played_at = last_played_at
    super(*args)
  end

  def can_be_archived?
    super && (Time.now.year - Date.parse(@last_played_at).year) > 2
  end
end
