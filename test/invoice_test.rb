require_relative 'test_helper'

class InvoiceTest < Minitest::Test

  def setup
    data = {:id => 1,
      :customer_id => 1,
      :merchant_id => 26,
      :status => "shipped"
     }
    @invoice = Invoice.new(data)
  end

  def test_it_exists
    assert @invoice
  end

  def test_it_has_an_id
    assert_equal 1, @invoice.id
  end

  def test_it_has_a_customer_id
    assert_equal 1, @invoice.customer_id
  end

  def test_it_has_a_merchant_id
    assert_equal 26, @invoice.merchant_id
  end

  def test_it_has_a_status
    assert_equal "shipped", @invoice.status
  end

end