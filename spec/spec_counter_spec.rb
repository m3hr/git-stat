require 'rspec'
require_relative './../lib/git_stat'
include RspecScanner

describe RspecScanner do
  # tried to loop through each fixture test, couldn't implement
  #it 'detects the correct hash values' do
  #  Dir[File.dirname(__FILE__) + '/fixtures/*.rb'].each do |fixture_test|
  #  test_spec_examples_array = rspec_scanner(fixture_test)
  #  rspec_output_finder(test_spec_examples_array).should == ({ :runtime => !nil, :examples => !nil, :failures => !nil, :pending => !nil })
  #
  #end
  #end

  it 'returns the correct # of examples, failures, pending' do
    test_spec_examples_array = rspec_scanner('./spec/fixtures/some_passing_some_failing_some_pending.rb')
    rspec_output_finder(test_spec_examples_array)[:examples].should == 4
    rspec_output_finder(test_spec_examples_array)[:failures].should == 1
    rspec_output_finder(test_spec_examples_array)[:pending].should == 1
  end
   #Hash.has_key? has_value?
  it 'can still work if the pending is non-existent' do
    test_spec_examples_array = rspec_scanner('./spec/fixtures/some_passing_some_failing_no_pending.rb')
    rspec_output_finder(test_spec_examples_array)[:examples].should == 3
    rspec_output_finder(test_spec_examples_array)[:failures].should == 1
    rspec_output_finder(test_spec_examples_array)[:pending].should == 0
  end
# super meta, super recursion error
#  it 'can run this very file correctly' do
#    test_spec_examples_array = rspec_scanner(__FILE__)
#    rspec_output_finder[:examples].should == 3
#  end
end
