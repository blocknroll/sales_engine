require_relative 'test_helper'

class CustomerParserTest < MiniTest::Test
# the customer parser takes in a csv file and turns the blob of data into customer objects. it must use the customer class in order to do this. it then passes the customers to the customer repo.

  def setup
    @customer_parser = CustomerParser.new
  end

  def test_it_exists
    assert @customer_parser
  end



  #build up to this test
  def test_it_can_read_a_csv_file
    last_row_name = "Ramona"
    customer_file = "test/fixtures/customers_fixtures.csv"
    assert_equal last_row_name, @customer_parser.make_customers(customer_file).last.first_name
    #your parser needs a method to open the file
  end

  def test_it_creates_a_customer_from_a_row
    skip
  end




  # def test_it_
  #
  # #we want to import the CSV file and parse the pieces such that our customer class can be populated

end

# require 'csv'
#
# class MerchantParser
#   attr_reader :filename
#
#   def initialize(input_filename)
#     @filename = input_filename
#   end
#
#   def parse
#     file = CSV.open(filename, :headers => true, :header_converters => :symbol)
#     file.map do |line|
#       Merchant.new(line, nil)
#     end
#   end
# end
