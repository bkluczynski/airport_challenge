require './lib/weather'

describe Weather do

it { is_expected.to respond_to(:stormy?) }

it 'allows to set a bad weather to a random day' do
  weather = Weather.new
  allow(subject).to receive(:stormy?).and_return(true)
    expect(subject.stormy?).to eq true

end

end
