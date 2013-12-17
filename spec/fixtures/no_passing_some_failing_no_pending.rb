describe 'No passing some failing no pending' do
  it "failes once" do
    true.should eq(false)
  end
  it "failes twice" do
    true.should eq(false)
  end
  it "passes three times" do
    true.should eq(false)
  end
end
