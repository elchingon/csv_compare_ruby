#!/usr/bin/env ruby
# Usage ruby csv_compare.rb targeted_filename.csv compared_filename.csv
# Output new csv file named new_{targeted_filename}.rb

require 'csv'

targeted_file = ARGV[0]
compare_file = ARGV[1]

CSV.open("new_" + targeted_file.to_s, "wb") do |csv|
  CSV.foreach(targeted_file) do |row|
    record_found = "No"
    CSV.foreach(compare_file) do |compare_row|
      if compare_row[1] == row[1]
	record_found = "Yes"
      end
    end

    csv << ["#{row[0]}","#{row[1]}", record_found]
  end
end
