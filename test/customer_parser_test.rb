require_relative 'test_helper'
# To do: remove instance variables.

class CustomerParserTest < MiniTest::Test

  def setup
    @customer_parser = CustomerParser.new
  end

  def test_it_exists
    assert @customer_parser
  end

  def test_it_can_read_a_csv_file
    last_row_name = "Ramona"
    customer_file = "test/fixtures/customers_fixtures.csv"
    assert_equal last_row_name, @customer_parser.make_customers(customer_file).last.first_name
  end

  def test_it_creates_a_customer_from_a_row
    skip
  end

end
