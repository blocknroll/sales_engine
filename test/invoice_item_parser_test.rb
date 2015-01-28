require_relative 'test_helper'

class InvoiceItemParserTest < Minitest::Test 

  attr_reader :invoice_item_parser, :sales_engine

  def setup
    @invoice_item_parser = InvoiceItemParser.new
    @sales_engine = SalesEngine.new
  end

  def test_it_exists
    assert invoice_item_parser
  end

  def test_it_creates_invoice_items
    file = "test/fixtures/invoice_items_fixtures.csv"
    assert_equal 10, invoice_item_parser.make_invoice_item(file, sales_engine).count
  end
  
end