require '../classes/authors'
require '../classes/games'
require '../classes/items'
describe Author do
  before :each do
    @author = Author.new('Sajid', 'Munawar')
  end

  context 'Test for author class' do
    it 'should be instance of author' do
      expect(@author).to be_an_instance_of Author
    end

    it 'should return first-name' do
      expect(@author.first_name).to eq('Sajid')
    end

    it 'should return last-name' do
      expect(@author.last_name).to eq('Munawar')
    end
  end
end
