require_relative 'test_helper'

class InvoiceItemTest < Minitest::Test 
# To do: remove instance variables.

  def setup
    @invoice_item = InvoiceItem.new(1, 539, 1, 5, 13635)
  end

  def test_it_exits
    assert @invoice_item
  end

  def test_it_has_an_id
    assert_equal 1, @invoice_item.id 
  end

  def test_it_has_an_item_id
    assert_equal 539, @invoice_item.item_id
  end

  def test_it_has_an_invoice_id
    assert_equal 1, @invoice_item.invoice_id
  end

  def test_it_has_a_quantity
    assert_equal 5, @invoice_item.quantity
  end

  def test_it_has_a_unit_price
    assert 13635, @invoice_item.unit_price
  end

# id,item_id,invoice_id,quantity,unit_price,created_at,updated_at
# 1,  539,   1,         5,       13635,     2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC

end 