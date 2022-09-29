require_relative './item'

class Genre
  attr_accessor :items
  attr_reader :id, :name

  def initialize(name)
    @id = rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self
  end
end
