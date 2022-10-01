require_relative '../classes/game'
require 'yaml'

describe Game do
  it 'should inherit behavior from Item' do
    expect(Game.superclass).to eq(Item)
  end

  before :all do
    @game = Game.new(2, '07/07/2022', '2/2/2015')
  end

  describe '#new' do
    it 'returns a new game object' do
      expect(@game).to be_an_instance_of Game
    end
    it 'throws an ArgumentError when given fewer than 3 parameters' do
      expect { Game.new(2, '07/07/2022') }.to raise_exception ArgumentError
    end
  end

  describe '#mulitiplayer' do
    it 'returns the correct mulitiplayer' do
      expect(@game.mulitiplayer).to eql 2
    end
  end

  describe '#last_played_at' do
    it 'returns the correct last_played_at' do
      expect(@game.last_played_at).to eql '07/07/2022'
    end
  end

  describe '#publish_date' do
    it 'returns the correct publish_date' do
      expect(@game.publish_date).to eql '2/2/2015'
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if publish_date is older then 10 years AND if last_played_at is older
     than 2 years, otherwise returns false' do
      expect(@game.can_be_archived?).to be false
      expect(Game.new(2, '2/2/2019', '2/2/2011').can_be_archived?).to be true
    end
  end
end
