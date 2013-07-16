require 'rspec'
require_relative './../lib/git_stat'
include RspecScanner

describe RspecScanner do
  it 'has the correct values of examples, fails, passes, pending' do
    test_spec_examples_array = rspec_scanner('./spec/fixtures/some_passing_no_failing_some_pending.rb')
    rspec_output_finder(test_spec_examples_array)
    example_numbers_array = [@number_of_examples, @number_of_failures, @number_of_pending]
    example_numbers_array.should == ([3, 0, 1])
  end
end
