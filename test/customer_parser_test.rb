require_relative 'test_helper'

class CustomerParserTest < MiniTest::Test

attr_reader :customer_parser, :sales_engine

  def setup
    @customer_parser = CustomerParser.new
    @sales_engine = SalesEngine.new
  end

  def test_it_exists
    assert customer_parser
  end

  def test_it_can_read_a_csv_file
    last_row_name = "Ramona"
    file = "test/fixtures/customers_fixtures.csv"
    assert_equal last_row_name, customer_parser.make_customer(file, sales_engine).last.first_name
  end

end
