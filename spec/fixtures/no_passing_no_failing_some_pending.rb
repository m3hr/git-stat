describe 'No passing no failing some pending' do
  xit "pends once" do
    true.should eq(false)
  end
  xit "pends the second time" do
    true.should eq(false)
  end
  xit "pends the third time" do
    true.should eq(true)
  end
end
