require_relative '../music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('loovee', '2021-03-10', true)
  end

  context 'When creating @music_album. an instance of class MusicAlbum' do
    it 'should take parameters and return source object' do
      @music_album.name.should eql 'loovee'
    end
  end

  context 'When creating music_album' do
    it 'should take parameters and return source object' do
      @music_album.publish_date.should eql '2021-03-10'
    end
  end
end
