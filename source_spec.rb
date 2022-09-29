require 'date'
require_relative '../classes/source'
require_relative '../classes/movie'

describe Source do
  before :all do
    @movie = Movie.new('the 100', '2015-08-03', true)
    @source = Source.new('a family')
  end

  context 'When creating @source. an instance of class source' do
    it 'should take parameters and return source object' do
      @source.should be_an_instance_of Source
    end
  end

  context 'When retrieving the name of a source' do
    it 'should return the source name' do
      expect(@source.name).to eq('a family')
    end
  end

  context 'When adding a movie into a source' do
    it 'should add the movie to the source' do
      @source.add_item(@movie)
      expect(@source.items).to include @movie
    end
  end
end
