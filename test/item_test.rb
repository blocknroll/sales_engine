require_relative 'test_helper'

class ItemTest < Minitest::Test

  attr_reader :item, :data

  def setup
    @data = {
      :id           => 1,
      :name         => "Item Qui Esse",
      :description  => "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.",
      :unit_price   => "75107",
      :merchant_id  => 1,
      :created_at   => "2012-03-27 14:53:59 UTC",
      :updated_at   => "2012-03-27 14:53:59 UTC"
    }
    @item = Item.new(data, self)
  end

  def test_it_exists
    assert item
  end

  def test_it_has_an_id
    assert_equal 1, item.id
  end

  def test_it_has_a_name
    assert_equal "Item Qui Esse", item.name
  end

  def test_it_has_a_description
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", item.description
  end

  def test_it_has_a_unit_price
    assert_equal "75107", item.unit_price
  end

  def test_it_has_a_merchant_id
    assert_equal 1, item.merchant_id
  end

  def test_it_has_a_created_at_timestamp
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_it_has_an_updated_at_timestamp
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end

  def test_it_can_find_invoice_items_by_item_id
    item_repo = Minitest::Mock.new
    item = Item.new(data, item_repo)
    item_repo.expect(:find_invoice_items_by_item_id, nil, [1])
    item.invoice_items
    item_repo.verify
  end

  def test_it_can_find_merchant_by_merchant_id
    item_repo = Minitest::Mock.new
    item = Item.new(data, item_repo)
    item_repo.expect(:find_merchant_by_merchant_id, nil, [1])
    item.merchant
    item_repo.verify
  end

end
