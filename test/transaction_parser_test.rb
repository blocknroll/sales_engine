require_relative 'test_helper'

class TransactionParserTest < Minitest::Test

  def setup 
    @transaction_parser = TransactionParser.new
  end

  def test_it_exists
    assert @transaction_parser
  end

  def test_it_makes_transactions
    file = 'test/fixtures/transactions_fixtures.csv'
    assert_equal "4654405418249632", @transaction_parser.make_transaction(file).first.cc_number
  end

end
