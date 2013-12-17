describe 'Some passing no failing some pending' do
  it "passes once" do
    true.should eq(true)
  end
  it "passes twice" do
    true.should eq(true)
  end

  xit "pends once" do
    true.should eq(true)
  end
end

