describe 'Some passing some failing no pending' do
  it "passes once" do
    true.should eq(true)
  end
  it "passes twice" do
    true.should eq(true)
  end
  it "fails the third time" do
    true.should eq(false)
  end
  fixture_examples = 3
  fixture_failures = 1
  fixture_pending = 0
end
