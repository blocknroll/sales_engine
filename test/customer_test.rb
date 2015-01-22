require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer'
# require 'csv'

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
#
# Josh's Advice
# class Parser < MiniTest::Test
#   def test_it_parses_stuff
#     rows = Parser.parse(some_csv)
#     # [{first_name: "Bob"}, {first_name: "Josh"}]
#     person = rows.first
#     assert_equal "Bob", person[:first_name]
#   end
# end
#
# class IntegrationTest < MiniTest::Test
#   def test_it_parses_a_csv_and_creates_a_customer
#     rows = Parser.parse(some_csv)
#     customers = Integrator.new(rows).customers
#
#     # rows.map do |person|
#     #   Customer.new(person[:first_name])
#     # end
#     assert customers.map do |customer|
#       customer.first_name
#     end.include?("Bob")
#   end
# end
