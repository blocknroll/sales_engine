require 'minitest/autorun'
# require 'minitest/pride'
require '../lib/customers'
require 'csv'

class CustomersTest < MiniTest::Test
  
  def setup
    @customers = Customers.new
    @customers_csv = CSV.open('../test/fixtures/customers_fixtures.csv', headers: true, header_converters: :symbol)
  end

  def test_it_exists
    assert @customers
  end

  def test_it_can_return_customer_id_one
    assert_equal "1", @customers_csv[:id]
  end

  def test_it_can_return_first_name
    assert_equal "Joey", @customers_csv[:first_name]
  end

  def test_it_can_return_last_name
    assert_equal "Ondricka", @customers_csv[:last_name]
  end

  def test_it_can_return_created_at
    assert_equal "2012-03-27 14:54:09 UTC", @customers_csv[:created_at]
  end

  def test_it_can_return_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", @customers_csv[:updated_at]
  end

  def test_it_can_return_all_instances
    #count the id's and return 100 
    #we want to be able to call a .all method on the class and have that .all method return every instance of the class
    assert_equal 100, @customers_csv[:id].count
  end


# all returns all instances
# random returns a random instance
# find_by_X(match), where X is some attribute, returns a single instance whose X attribute case-insensitive attribute matches the match parameter. For instance, customer_repository.find_by_first_name("Mary") could find a Customer with the first name attribute "Mary" or "mary" but not "Mary Ellen".
# find_all_by_X(match) works just like find_by_X except it returns a collection of all matches. If there is no match, it returns an empty Array

#we need an invoice method that returns an instance of Invoice associated with customer object. 


end
