require_relative 'test_helper'

class TransactionRepositoryTest < Minitest::Test 
  
  def setup
    @transaction_repo = TransactionRepository.new("test/fixtures/transactions_fixtures.csv")
  end

  def test_it_exists
    assert @transaction_repo
  end

  def test_it_returns_all_instances_of_transaction
    assert_equal 10, @transaction.all
  end


end