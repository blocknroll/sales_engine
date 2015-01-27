require_relative 'test_helper'

class ItemParserTest < MiniTest::Test

  attr_reader :item_parser

  def setup
    @item_parser = ItemParser.new
  end

  def test_it_exists
    assert item_parser
  end

  def test_it_can_read_a_csv_file
    last_row_name = "Item Soluta Libero"
    file = "test/fixtures/items_fixtures.csv"
    assert_equal "Item Soluta Libero", item_parser.make_items(file).last.name
  end

end
