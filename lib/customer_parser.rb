require 'csv'
require_relative 'customer'

class CustomerParser

  def make_customers(customer_file)
    contents = CSV.open(customer_file, headers: true, header_converters: :symbol)
    parse(contents)
  end

  private
  def parse(contents)
    contents.map { |row| Customer.new(
      row[:id],
      row[:first_name],
      row[:last_name]
      ) }
  end

end
