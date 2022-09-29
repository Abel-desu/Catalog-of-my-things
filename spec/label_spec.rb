require_relative '../classes/label'

describe Label do
  before(:all) do
    @label = Label.new('label', 'black')
  end
  it 'should be an instance of Label' do
    expect(@label).to be_an_instance_of(Label)
  end
  it 'should have a title' do
    expect(@label.title).to eq('label')
  end
  it 'should have a color' do
    expect(@label.color).to eq('black')
  end
  describe '#add_item' do
    it 'should add an item to the label' do
      @item = Item.new('2021-07-04')
      @label.add_item(@item)
      expect(@label.instance_variable_get(:@items)).to include(@item)
    end
  end
end
