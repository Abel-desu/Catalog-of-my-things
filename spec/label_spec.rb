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
end
