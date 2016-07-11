require "./lib/airport"
require "./lib/plane"
require "./lib/weather"

describe Airport do

plane = Plane.new

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }

  it "creates the hangar with a default capacity" do
      expect(subject.capacity).to eq Airport::MAX_CAPACITY
  end

  context "when there is a good weather" do

    before(:each) {allow(subject).to receive(:stormy?).and_return(false)}



  it "won't let the plane to land if the airport is full" do
    Airport::MAX_CAPACITY.times {subject.land(Plane.new)}
      expect{subject.land(plane)}.to raise_error 'Airport is full'
  end


  it "won't let the plane to take off if the airport is empty" do
    expect{subject.take_off}.to raise_error 'Airport is empty'
  end


  it 'lets a plane to take off' do
    subject.land(plane)
      expect(subject.take_off).to eq plane
  end

  it 'stores a landed plane' do
      subject.land(plane)
        expect(subject.landed_planes).to eq 1
  end

end
  context "when there is a bad weather" do

    before(:each) {allow(subject).to receive(:stormy?).and_return(true)}

    it "won't let the plane to land" do
      expect{subject.land(plane)}.to raise_error "The weather does not allow to land"
    end


    it "won't let the plane to take off" do
      airport = Airport.new
      airport.land(plane)
      allow(airport).to receive(:stormy?).and_return(true)
      expect{airport.take_off}.to raise_error "The weather does not allow to take off"
    end


  end

  end
