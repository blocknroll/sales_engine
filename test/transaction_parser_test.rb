require_relative 'test_helper'

class TransactionParserTest < Minitest::Test

  attr_reader :transaction_parser, :sales_engine

  def setup 
    @transaction_parser = TransactionParser.new
    @sales_engine = SalesEngine.new
  end

  def test_it_exists
    assert transaction_parser
  end

  def test_it_makes_transactions
    file = 'test/fixtures/transactions_fixtures.csv'
    assert_equal "4654405418249632", transaction_parser.make_transaction(file, sales_engine).first.cc_number
  end

end
