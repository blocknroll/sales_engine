require_relative 'test_helper'

class CustomerRepositoryTest < Minitest::Test

attr_reader :customer_repo

def setup
    @customer_repo = CustomerRepository.new("test/fixtures/customers_fixtures.csv", SalesEngine.new)
  end

  def test_it_exists
    assert customer_repo
  end

  def test_the_file_to_read_exists
    assert File.exist?(customer_repo.file)
  end

  def test_it_returns_all_instances
    assert_equal 10, customer_repo.all.count
  end

  def test_it_returns_a_random_instance
    result = []
    100.times { result << customer_repo.random }
    result = result.uniq
    assert result.count > 1
    #create an empty array and shovel in 100 samples from the customer repo (you are grabbing 100 samples from all the customers that are located in the customer repo). Then run uniq on the sample array, and it will pull out all the values that are duplicates. probably you will have 10 in there, very likely you'll have 9, but it is almost certain that you will have more than 1. So that is how you can test if it is returning a random instance.
  end

  def test_it_returns_a_find_by_first_name_match
    assert_equal "Joey Ondricka", customer_repo.find_by_first_name("Joey").full_name
  end

  def test_it_returns_a_find_by_first_name_lowercase_match
    assert_equal "Joey Ondricka", customer_repo.find_by_first_name("joey").full_name
  end

  def test_it_returns_a_find_by_last_name_match
    assert_equal "Joey Ondricka", customer_repo.find_by_last_name("Ondricka").full_name
  end

  def test_it_returns_a_find_by_last_name_lowercase_match
    assert_equal "Joey Ondricka", customer_repo.find_by_last_name("ondricka").full_name
  end

  def test_it_returns_a_find_by_id_match
    assert_equal "Joey Ondricka", customer_repo.find_by_id("1").full_name
  end

  def test_it_returns_a_find_all_by_first_name_match
    assert_equal 3, customer_repo.find_all_by_first_name("Joey").count
  end

  def test_it_returns_a_find_all_by_last_name_match
    assert_equal 2, customer_repo.find_all_by_last_name("Ondricka").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_last_name_match_exists
    assert_equal [], customer_repo.find_all_by_last_name("ndricka")
  end

  def test_it_returns_zero_when_no_find_all_by_last_name_match_exists
    assert_equal 0, customer_repo.find_all_by_last_name("ndricka").count
  end

  def test_it_has_a_parent
    assert customer_repo.parent.is_a? SalesEngine
  end

  def test_a_customer_can_find_its_invoices
    customer = customer_repo.find_by_id("1")
    assert_equal 5, customer.invoices.count
  end

end
