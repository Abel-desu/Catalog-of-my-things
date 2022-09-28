require_relative 'item'
class Movie < Item
  attr_reader :id
  attr_accessor :name, :publish_date, :silent

  def initialize(name, publish_date, silent)
    super(publish_date)
    @id = Random.rand(1...1000)
    @name = name
    @silent = silent
  end

  def can_be_archived?
    super || @silent == true
  end
end
