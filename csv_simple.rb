#!/usr/bin/env ruby

require 'csv'

targeted_file = ARGV[0]
compare_file = ARGV[1]


CSV.open("new_" + targeted_file.to_s, "wb") do |csv|
    record_found = "No"
    CSV.foreach(compare_file) do |compare_row|
    p compare_row[1]
    csv << [compare_row[1], record_found]
  end
end
