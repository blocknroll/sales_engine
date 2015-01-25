require_relative 'test_helper'

class CustomerTest < MiniTest::Test

  attr_reader :customer

  def setup
    data = {
      :id           => 1, 
      :first_name   => "Joey", 
      :last_name    => "Ondricka", 
      :created_at   => "2012-03-27", 
      :updated_at   => "2012-03-27"
    }
    @customer = Customer.new(data)
  end

  def test_it_exists
    assert customer
  end

  def test_it_has_a_first_name
    assert_equal "Joey", customer.first_name
  end

  def test_it_has_a_different_first_name
    data = {
      :id         => 2, 
      :first_name => "Timmy", 
      :last_name  => "Doe", 
      :created_at => "2012-03-27", 
      :updated_at => "2012-03-27"
    }
    customer = Customer.new(data)
    assert_equal "Timmy", customer.first_name
  end

  def test_it_has_a_last_name
    assert_equal "Ondricka", customer.last_name
  end

  def test_it_has_an_id
    assert_equal 1, customer.id
  end

end
