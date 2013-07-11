require 'csv'

module RspecScanner
  def rspec_scanner(file_specified)
    %x( rspec #{file_specified} ).scan(/\d+\.\d+ second.|\d+ example.|\d+ failure.|\d+ pending/)
  end
  #exec? edit: no need, string interpolation works in rspec_scanner
  #spec_examples_array = rspec_scanner("~/junk/git-stat/spec/fixtures/no_passing_no_failing_some_pending.rb")
  
  def title_csv(csv_file_location)
    CSV.open("#{csv_file_location}","ab") do |csv|
      csv << ["Run time of tests", "Examples", "Failures", "Pending"]
    end
  end
  #spec_run_time = %x( rspec ).scan(/\d+\.\d+ seconds/)
  def rspec_output_finder(current_array)
    current_array.each do |case_example|
      if !case_example.scan(/\d+\.\d+ second./).empty?
        test_runtime = case_example.scan(/\d+\.\d+/)
        puts "seconds", test_runtime
      elsif !case_example.scan(/\d+ example./).empty?
        number_of_examples = case_example.scan(/\d+/)
        puts "examples", number_of_examples
      elsif !case_example.scan(/\d+ failure./).empty?
        number_of_failures = case_example.scan(/\d+/)
        puts "failures", number_of_failures
      elsif !case_example.scan(/\d+ pending/).empty?
        number_of_pending = case_example.scan(/\d+/)
        puts "pending", number_of_pending
      end
    end
  end
  
  def append_spec_data(time, examples, failures, pending, csv_file_location) 
    saved_current_time = Time.now  
    CSV.open("#{csv_file_location}","ab") do |csv|
      csv << ["#{time}", "#{examples}", "#{failures}", "#{pending}"]  
    end
  end  
end

