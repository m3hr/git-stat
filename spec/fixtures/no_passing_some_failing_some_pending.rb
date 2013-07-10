describe 'No passing some failing some pending' do
  it "fails once" do
    true.should eq(false)
  end
  it "fails the second time" do
    true.should eq(false)
  end
  xit "pends the third time" do
    true.should eq(true)
  end
end
