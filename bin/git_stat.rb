#!/usr/bin/env ruby
puts 'Welcome to git-stat, what type of metric should I run? Type "list" for a list of metrics'
type_of_metric = gets.chomp
case type_of_metric
  when "list"
    puts ''
  when "rspec"
    spec_examples_array = rspec_scanner()

    rspec_output_finder(spec_examples_array)
end
