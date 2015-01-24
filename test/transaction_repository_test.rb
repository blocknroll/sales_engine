require_relative 'test_helper'

class TransactionRepositoryTest < Minitest::Test 
  
  def setup
    @transaction_repo = TransactionRepository.new("test/fixtures/transactions_fixtures.csv")
  end

  def test_it_exists
    assert @transaction_repo
  end

  def test_the_file_to_read_exists
    assert File.exist?(@transaction_repo.file)
  end

  def test_it_returns_all_instances
    assert_equal 10, @transaction_repo.all.count
  end

  def test_it_returns_a_random_instance
    result = []
    100.times { result << @transaction_repo.random }
    result = result.uniq
    assert result.count > 1  
  end

  def test_it_returns_a_find_by_id_match
    assert_equal "1", @transaction_repo.find_by_id("1").id 
  end

  def test_it_returns_a_find_by_invoice_id_match
    assert_equal "1", @transaction_repo.find_by_invoice_id("1").invoice_id
  end

  def test_it_returns_a_find_by_cc_number_match
    assert_equal "4654405418249632", @transaction_repo.find_by_cc_number("4654405418249632").cc_number
  end

  def test_it_returns_a_find_by_cc_exp_date_match
  end

  def test_it_returns_a_find_by_result_match
  end

  def test_it_returns_a_find_by_created_at_match
  end

  def test_it_returns_a_find_by_updated_at_match
  end

  def test_it_returns_a_find_all_by_id_match
    #This doesnt make sense to run, does it?
  end

  def test_it_returns_a_find_all_by_invoice_id_match
  end

  def test_it_returns_a_find_all_by_credit_card_match
  end

  def test_it_returns_a_find_all_by_credit_card_exp_date_match
  end

  def test_it_returns_a_find_all_by_result_match
  end

  def test_it_returns_a_find_all_by_created_at_match
  end

  def test_it_returns_a_find_all_by_updated_at_match
  end

end