require 'rspec'
require_relative './../lib/git_stat'
include RspecScanner

describe RspecScanner do
  it 'has the correct values of num examples, fails, pending' do
    test_spec_examples_array = rspec_scanner('./spec/fixtures/some_passing_no_failing_some_pending.rb')
    rspec_output_finder(test_spec_examples_array).should == ([3, 0, 1])
  end

  it 'can still work if the pending is non-existent' do
    test_spec_examples_array = rspec_scanner('./spec/fixtures/some_passing_some_failing_no_pending.rb')
    rspec_output_finder(test_spec_examples_array).should == ([3, 1, 0])
  end
end
