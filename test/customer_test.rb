require 'minitest/autorun'
# require 'minitest/pride'
require_relative '../lib/customer'


class CustomerTest < MiniTest::Test

  def test_it_exists
    customer = Customer.new(1, "Bob", "Smith")
    assert customer
  end

  def test_it_has_a_first_name
    customer = Customer.new(1, "Bob", "Smith")
    assert_equal "Bob", customer.first_name
  end

  def test_it_has_a_different_first_name
    customer = Customer.new(2, "Timmy", "Doe")
    assert_equal "Timmy", customer.first_name
  end

  def test_it_has_a_last_name
    customer = Customer.new(1, "Bob", "Smith")
    assert_equal "Smith", customer.last_name
  end

  def test_it_has_an_id
    customer = Customer.new(1, "Bob", "Smith")
    assert_equal 1, customer.id
  end

end
