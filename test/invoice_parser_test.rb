require_relative 'test_helper'

class InvoiceParserTest < Minitest::Test 

  attr_reader :invoice_parser

  def setup
    @invoice_parser = InvoiceParser.new
  end

  def test_it_exists
    assert invoice_parser
  end

  def test_it_can_read_a_csv_file
    last_row_status = "shipped"
    invoice_file = "test/fixtures/invoices_fixtures.csv"
    assert_equal last_row_status, invoice_parser.make_invoices(invoice_file).last.status 
  end

end