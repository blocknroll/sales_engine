require_relative 'test_helper'

class InvoiceTest < Minitest::Test

  attr_reader :invoice, :data

  def setup
    @data = {
      :id => 1,
      :customer_id => 1,
      :merchant_id => 26,
      :status => "shipped"
     }
    @invoice = Invoice.new(data, self)
  end

  def test_it_exists
    assert invoice
  end

  def test_it_has_an_id
    assert_equal 1, invoice.id
  end

  def test_it_has_a_customer_id
    assert_equal 1, invoice.customer_id
  end

  def test_it_has_a_merchant_id
    assert_equal 26, invoice.merchant_id
  end

  def test_it_has_a_status
    assert_equal "shipped", invoice.status
  end

  def test_it_is_connected_to_invoice_repository
    invoice_repository = Minitest::Mock.new
    invoice = Invoice.new(data, invoice_repository)
    invoice_repository.expect(:find_transactions_by_invoice_id, nil, [1])
    invoice.transactions
    invoice_repository.verify
  end

end
