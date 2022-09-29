require_relative './item'

class Labels
  attr_accessor :title, :items, :color
  attr_reader :id

  def initialize(name, color)
    @id = Random.rand(1..1000)
    @name = name
    @color = color
    @items = []
  end

  def add_item(item)
    items << item
    item.label = self
  end
end
