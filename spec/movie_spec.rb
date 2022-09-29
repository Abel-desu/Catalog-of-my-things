require_relative '../classes/movie'

describe Movie do
  before :each do
    @movie = Movie.new('loovee', '2021-03-10', true)
  end

  context 'When getting the name of a movie' do
    it 'should return the correct movie name' do
      expect(@movie.name).to eq('loovee')
    end
  end

  context 'When checking the published date' do
    it 'it should return a published date' do
      expect(@movie.publish_date).to eq('2021-03-10')
    end
  end
end
