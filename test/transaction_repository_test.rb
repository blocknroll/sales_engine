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

  def test_it_returns_a_find_by_result_match
    assert_equal "failed", @transaction_repo.find_by_result("failed").result
  end

  def test_it_returns_a_find_by_created_at_match
    # Do we need to do a method for this? I dont think so, no references to this elsewhere
  end

  def test_it_returns_a_find_by_updated_at_match
    # Do we need to do a method for this? I dont think so, no references to this elsewhere
  end

  def test_it_returns_a_find_all_by_id_match
    # This value is unique so no reason to have a method to find all by - there is only ever 1.
  end

  def test_it_returns_a_find_all_by_invoice_id_match
    # This is unique too but it maps on to the invoice class so I will write a method... not sure if I need to though
    assert_equal 1, @transaction_repo.find_all_by_invoice_id("1").count
  end

  def test_it_returns_a_find_all_by_credit_card_match
    assert_equal 2, @transaction_repo.find_all_by_cc_number("4654405418249632").count
  end

  def test_it_returns_a_find_all_by_credit_card_exp_date_match
    # Do we need to do a method for this? I dont think so, no references to this elsewhere
  end

  def test_it_returns_a_find_all_by_result_match
    assert_equal 2, @transaction_repo.find_all_by_result("failed").count
  end

  def test_it_returns_a_find_all_by_created_at_match
    # Do we need to do a method for this? I dont think so, no references to this elsewhere
  end

  def test_it_returns_a_find_all_by_updated_at_match
    # Do we need to do a method for this? I dont think so, no references to this elsewhere
  end

end