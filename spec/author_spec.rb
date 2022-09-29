require_relative '../classes/author'
require_relative '../classes/game'
require 'yaml'

describe Author do
  before :all do
    @author = Author.new('Abel', 'Desalegn')
  end
  describe '#new' do
    it 'returns a new author object' do
      expect(@author).to be_an_instance_of Author
    end
    it 'throws an ArgumentError when given fewer than 2 parameters' do
      expect { Author.new('Abel') }.to raise_exception ArgumentError
    end
  end
  describe '#first_name' do
    it 'returns the correct first_name' do
      expect(@author.first_name).to eql 'Abel'
    end
  end
  describe '#last_name' do
    it 'returns the correct last_name' do
      expect(@author.last_name).to eql 'Desalegn'
    end
  end
  describe '#items' do
    it 'returns the correct items' do
      expect(@author.items).to eql []
      game = Game.new('Sajid', '12/01/2022', '12/01/2022')
      @author.add_item(game)
      expect(@author.items).to eql [game]
      expect(game.author).to eql @author
    end
  end
end
