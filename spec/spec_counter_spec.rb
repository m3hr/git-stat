require 'rspec'
require_relative './../lib/git_stat'
include RspecScanner

describe RspecScanner do
  Dir[File.dirname(__FILE__) + '/fixtures/*.rb'].each do |fixture_test|
    test_spec_examples_array = rspec_scanner(fixture_test)
    rspec_output_finder(test_spec_examples_array).should == ([3, 0, 1])
  end
  end

  it 'can still work if the pending is non-existent' do
    test_spec_examples_array = rspec_scanner('./spec/fixtures/some_passing_some_failing_no_pending.rb')
    rspec_output_finder(test_spec_examples_array).should == ([3, 1, 0])
  end
end
