require 'csv'
require_relative 'git_stat/utils'
include GitStat
require 'json'
module RspecScanner
  def rspec_scanner(file_specified)
    %x( rspec #{file_specified} ).scan(/\d+\.\d+ second|\d+ example|\d+ failure|\d+ pending/)
  end

  #exec? edit: no need, string interpolation works in rspec_scanner with %x

  def title_csv(csv_file_location)
    CSV.open("#{csv_file_location}", "ab") do |csv|
      csv << ["Run time of tests", "Examples", "Failures", "Pending"]
    end
  end

  #spec_run_time = %x( rspec ).scan(/\d+\.\d+ seconds/)
  def rspec_output_finder(current_array)
    cases_hash = { 
      :runtime => 0.0, 
      :examples => 0, 
      :failures => 0, 
      :pending => 0 
    }

    puts current_array
    current_array.each do |case_example|
      if !case_example.is_regex_empty?('\\d+ second')        
        cases_hash[:runtime] = case_example.scan(/\d+\.\d+/)[0].to_f
        #puts "seconds", test_runtime
      elsif !case_example.is_regex_empty?('\\d+ example')
        cases_hash[:examples] = case_example.scan(/\d+/)[0].to_i
        #puts "examples", number_of_examples
      elsif !case_example.is_regex_empty?('\\d+ failure')
        cases_hash[:failures] = case_example.scan(/\d+/)[0].to_i
        #puts "failures", number_of_failures
      elsif !case_example.is_regex_empty?('\\d+ pending')
        cases_hash[:pending] = case_example.scan(/\d+/)[0].to_i
        #puts "pending", number_of_pending
      elsif case_example.is_regex_empty?('\\d+ pending')
        cases_hash[:pending] = 0
        # pending is the only metric that has the possibility to not appear in the rspec output
      end

    end
    return cases_hash

  end

  def append_spec_data(time, examples, failures, pending, csv_file_location)
    saved_current_time = Time.now #.to_s
    CSV.open("#{csv_file_location}", "ab") do |csv|
      csv << %W(#{time} #{examples} #{failures} #{pending})
    end
  end

  def cases_hash_to_json(specified_file)
    specified_file_array = rspec_scanner(specified_file)
    file_hash = rspec_output_finder(specified_file_array)
    file_hash.to_json
  end
end
