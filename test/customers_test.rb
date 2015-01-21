require 'minitest/autorun'
require 'minitest/pride'
require './lib/customers'

class CustomersTest < MiniTest::Test
  def test_it_exists
    customers = Customers.new
    assert customers
  end

  # def test_it_can_open_a_csv
  #   customers_csv = CSV.open('customers.csv', headers: true, header_converters: :symbol)
  #   # csv.each do |row|
  #   #   puts row["last_name"]
  #   # end
  #   assert_equal
  # end

  # def test_it_can_identify_customer_id_1
  #   customers_csv = CSV.open('customers.csv', headers: true, header_converters: :symbol)
  # end

end
