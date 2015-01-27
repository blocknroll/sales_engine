require_relative 'test_helper'

class MerchantParserTest < MiniTest::Test

  attr_reader :merchant_parser

  def setup
    @merchant_parser = MerchantParser.new
  end

  def test_it_exists
    assert merchant_parser
  end

  def test_it_can_read_a_csv_file
    last_row_name = "Williamson Group"
    file = "test/fixtures/merchants_fixtures.csv"
    assert_equal last_row_name, merchant_parser.make_merchant(file).last.name
  end

end
