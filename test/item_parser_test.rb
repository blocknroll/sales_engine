require_relative 'test_helper'

class ItemParserTest < MiniTest::Test

  attr_reader :item_parser, :sales_engine

  def setup
    @item_parser  = ItemParser.new
    @sales_engine = SalesEngine.new
  end

  def test_it_exists
    assert item_parser
  end

  def test_it_can_read_a_csv_file
    last_row_name = "Item Soluta Libero"
    file = "test/fixtures/items_fixtures.csv"
    assert_equal "Item Soluta Libero", item_parser.make_item(file, sales_engine).last.name
  end

end
