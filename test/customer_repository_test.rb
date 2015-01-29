require_relative 'test_helper'

class CustomerRepositoryTest < Minitest::Test

attr_reader :customer_repository, :sales_engine, :data

def setup
    @data = "test/fixtures/customers_fixtures.csv"
    @customer_repository = CustomerRepository.new("test/fixtures/customers_fixtures.csv", self)
     # @sales_engine = SalesEngine.new
    @sales_engine = Minitest::Mock.new
  end

  def test_it_exists
    assert customer_repository
  end

  def test_the_file_to_read_exists
    assert File.exist?(customer_repository.file)
  end

  def test_it_returns_all_instances
    assert_equal 10, customer_repository.all.count
  end

  def test_it_returns_a_random_instance
    result = []
    100.times { result << customer_repository.random }
    result = result.uniq
    assert result.count > 1
    #create an empty array and shovel in 100 samples from the customer repo (you are grabbing 100 samples from all the customers that are located in the customer repo). Then run uniq on the sample array, and it will pull out all the values that are duplicates. probably you will have 10 in there, very likely you'll have 9, but it is almost certain that you will have more than 1. So that is how you can test if it is returning a random instance.
  end

  def test_it_returns_a_find_by_first_name_match
    assert_equal "Joey Ondricka", customer_repository.find_by_first_name("Joey").full_name
  end

  def test_it_returns_a_find_by_first_name_lowercase_match
    assert_equal "Joey Ondricka", customer_repository.find_by_first_name("joey").full_name
  end

  def test_it_returns_a_find_by_last_name_match
    assert_equal "Joey Ondricka", customer_repository.find_by_last_name("Ondricka").full_name
  end

  def test_it_returns_a_find_by_last_name_lowercase_match
    assert_equal "Joey Ondricka", customer_repository.find_by_last_name("ondricka").full_name
  end

  def test_it_returns_a_find_by_id_match
    assert_equal "Joey Ondricka", customer_repository.find_by_id("1").full_name
  end

  def test_it_returns_a_find_all_by_first_name_match
    assert_equal 3, customer_repository.find_all_by_first_name("Joey").count
  end

  def test_it_returns_a_find_all_by_last_name_match
    assert_equal 2, customer_repository.find_all_by_last_name("Ondricka").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_last_name_match_exists
    assert_equal [], customer_repository.find_all_by_last_name("ndricka")
  end

  def test_it_returns_zero_when_no_find_all_by_last_name_match_exists
    assert_equal 0, customer_repository.find_all_by_last_name("ndricka").count
  end

  # def test_it_has_a_parent
  #   assert customer_repository.sales_engine.is_a? SalesEngine
  # end - have to remove because sales engine is actually a mock

  # def test_a_customer_can_find_its_invoices
  #   customer = customer_repository.find_by_id("1")
  #   assert_equal 5, customer.invoices.count
  # end - remove this test because it will bog down the system/tests

  def test_method_calls_sales_engine
    customer_repository = CustomerRepository.new(data, sales_engine)
    sales_engine.expect(:find_invoices_by_customer_id, nil, [1]) 
    customer_repository.find_invoices_by_id(1)
    sales_engine.verify
  end

end
