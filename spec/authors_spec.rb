require_relative '../classes/authors'
require_relative '../classes/games'
require_relative '../classes/item'

describe Author do
  before do
    @author = Author.new('Robert', 'Jordan')
    @book = Book.new('Drama', 'us', 'source', 'book label', '22-3-2010', 'us', 'good')
  end

  it 'Creating a new author' do
    expect(@author.first_name).to eq('Robert')
    expect(@author.last_name).to eq('Jordan')
    expect(@author.items).to eq([])
    expect(@author.id).to match(Integer)
  end

  it 'add_item methode should add a new item to the author' do
    @author.add_item(@book)
    expect(@author.items).to eq([@book])
  end
end