require 'minitest/test'
require 'minitest/pride'
require 'csv'
require_relative '../lib/customer_parser'

class CustomerParserTest < MiniTest::Test

  def setup
    @customer = Customer.new(row)
    @customers_csv = CSV.open('../test/support/customers_fixtures.csv', headers: true, header_converters: :symbol)
  end

  def test_it_exists
    assert @customer
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
