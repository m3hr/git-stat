describe 'Some passing some failing some pending' do
  it "passes once" do
    true.should eq(true)
  end
  it "passes twice" do
    true.should eq(true)
  end
  it "fails the third time" do
    true.should eq(false)
  end
  xit "pends the fourth time" do
    true.should eq(true)
  end
end
