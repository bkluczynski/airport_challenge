require "airport"

describe Airport do

  let(:plane) {Airplane.new}

  it { is_expected.to respond_to(:land).with(1).argument }




end
