require_relative 'test_helper'

class InvoiceItemTest < Minitest::Test 

  attr_reader :invoice_item

  def setup
    data = {
      :id         => 1,
      :item_id    => 539,
      :invoice_id => 1,
      :quantity   => 5,
      :unit_price => 13635
      }
    @invoice_item = InvoiceItem.new(data, self)
  end

  def test_it_exits
    assert invoice_item
  end

  def test_it_has_an_id
    assert_equal 1, invoice_item.id 
  end

  def test_it_has_an_item_id
    assert_equal 539, invoice_item.item_id
  end

  def test_it_has_an_invoice_id
    assert_equal 1, invoice_item.invoice_id
  end

  def test_it_has_a_quantity
    assert_equal 5, invoice_item.quantity
  end

  def test_it_has_a_unit_price
    assert 13635, invoice_item.unit_price
  end

end 