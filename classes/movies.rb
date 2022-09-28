require_relative './item'

class Movie < Item
  attr_accessor :silent, :name

  def initialize(name, genre, author, source, label, publish_date, silent)
    super(genre, author, source, label, publish_date)
    @silent = silent
    @name = name
  end

  def can_be_archived?
    super || silent
  end
end
