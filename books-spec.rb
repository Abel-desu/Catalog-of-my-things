require_relative './books'

describe Book do
  before :each do
    @book = Book.new 'The fighter', 'Good', '2021-07-02'
  end

  context 'when testing the Book class' do
    it 'should return true if object is an instance of the Book class' do
      expect(@book).to be_an_instance_of Book
    end

    it 'should returning false while acquiring the cover_state property' do
      cover_state = @book.cover_state == 'Bad'
      expect(cover_state).to be false
    end

    it 'should return false when calling the can_be_archived? method' do
      expect(@book.can_be_archived?).to be false
    end
  end
end
