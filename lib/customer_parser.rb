require 'csv'
require_relative 'customer'

class CustomerParser

  def make_customers(customer_file_to_read)
    contents = CSV.open(customer_file_to_read, headers: true, header_converters: :symbol)
    parse_file(contents)
  end

  def parse_file(contents)
    contents.map { |row| Customer.new(
      row[:id],
      row[:first_name],
      row[:last_name]
      ) }
  end



end
