require_relative 'test_helper'
# To do: remove instance variables.

class CustomerTest < MiniTest::Test
# To do: remove instance variables.

  def setup
    @customer = Customer.new(1, "Joey", "Ondricka", "2012-03-27", "2012-03-27")
  end

  def test_it_exists
    assert @customer
  end

  def test_it_has_a_first_name
    assert_equal "Joey", @customer.first_name
  end

  def test_it_has_a_different_first_name
    @customer = Customer.new(2, "Timmy", "Doe", "2012-03-27", "2012-03-27")
    assert_equal "Timmy", @customer.first_name
  end

  def test_it_has_a_last_name
    assert_equal "Ondricka", @customer.last_name
  end

  def test_it_has_an_id
    assert_equal 1, @customer.id
  end

end
