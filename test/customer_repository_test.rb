require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test

  def test_it_exists
    customer_repo = CustomerRepository.new(["Customer 1", "Customer 2", "Customer 3"])
    assert customer_repo
  end

  def test_it_has_a_customer_array
    customer_repo = CustomerRepository.new(["Customer 1", "Customer 2", "Customer 3"])
    assert_equal Array, customer_repo.class
  end

  # def test_it_can_identify_first_position
  #   customer_repo = CustomerRepository.new(["Customer 1", "Customer 2", "Customer 3"])
  #   assert_equal "Customer 1", customer_repo[0]
  # end


# <CSV::Row id:"1" first_name:"Joey" last_name:"Ondricka" created_at:"2012-03-27 14:54:09 UTC" updated_at:"2012-03-27 14:54:09 UTC">


    # all returns all instances
    # random returns a random instance
    # find_by_X(match), where X is some attribute, returns a single instance whose X attribute case-insensitive attribute matches the match parameter. For instance, customer_repository.find_by_first_name("Mary") could find a Customer with the first name attribute "Mary" or "mary" but not "Mary Ellen".
    #   find_all_by_X(match) works just like find_by_X except it returns a collection of all matches. If there is no match, it returns an empty Array.


end
