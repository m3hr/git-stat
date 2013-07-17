require 'csv'
require_relative 'git_stat/utils'
include GitStat

module RspecScanner
  def rspec_scanner(file_specified)
    %x( rspec #{file_specified} ).scan(/\d+\.\d+ second|\d+ example|\d+ failure|\d+ pending/)
  end
  #exec? edit: no need, string interpolation works in rspec_scanner with %x

  def title_csv(csv_file_location)
    CSV.open("#{csv_file_location}","ab") do |csv|
      csv << ["Run time of tests", "Examples", "Failures", "Pending"]
    end
  end
  #spec_run_time = %x( rspec ).scan(/\d+\.\d+ seconds/)
  def rspec_output_finder(current_array)
    cases_array = []
    test_runtime = 0.0
    number_of_examples = 0
    number_of_failures = 0
    number_of_pending = 0
    puts current_array
    current_array.each do |case_example|
      if !case_example.is_regex_empty?("\\d+ second")
        test_runtime = case_example.scan(/\d+\.\d+/)[0].to_f
        #puts "seconds", test_runtime
      elsif !case_example.is_regex_empty?("\\d+ example")
        number_of_examples = case_example.scan(/\d+/)[0].to_i
        #puts "examples", number_of_examples
      elsif !case_example.is_regex_empty?("\\d+ failure")
        number_of_failures = case_example.scan(/\d+/)[0].to_i
        #puts "failures", number_of_failures
      elsif !case_example.is_regex_empty?("\\d+ pending")
        number_of_pending = case_example.scan(/\d+/)[0].to_i
        #puts "pending", number_of_pending
      elsif case_example.is_regex_empty?("\\d+ pending")
        number_of_pending = 0
        #pending is the only metric that has the possibility to not appear in the rspec output
      end

    end
    cases_array << test_runtime << number_of_examples << number_of_failures << number_of_pending
    return cases_array

  end
  def append_spec_data(time, examples, failures, pending, csv_file_location)
    saved_current_time = Time.now#.to_s
    CSV.open("#{csv_file_location}","ab") do |csv|
      csv << %W(#{time} #{examples} #{failures} #{pending})
    end
  end
end
