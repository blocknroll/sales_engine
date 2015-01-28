require_relative 'test_helper'

class MerchantTest < Minitest::Test

  attr_reader :merchant

  def setup
    data = {
      :id         => 1,
      :name       => "Schroeder-Jerde",
      :created_at => "2012-03-27 14:53:59 UTC",
      :updated_at => "2012-03-27 14:53:59 UTC"
    }
    @merchant = Merchant.new(data)
  end

  def test_it_exists
    assert merchant
  end

  def test_it_has_an_id
    assert_equal 1, merchant.id
  end

  def test_it_has_a_name
    assert_equal "Schroeder-Jerde", merchant.name
  end

  def test_it_has_a_created_at_timestamp
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_it_has_an_updated_at_timestamp
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
  end



  # def test_it_can_find_items_by_id
  #   assert_equal "", merchant.items
  # end

end



# # Jeff's example tests - with nil
#
# def test_it_stores_an_id
#   merchant = Merchant.new({:id => 6}, nil)
#   assert_equal 6, merchant.id
# end
#
# def test_it_stores_ids_as_integers_only
#   merchant = Merchant.new({:id => '6'}, nil)
#   assert_equal 6, merchant.id
# end
#
# def test_it_stores_a_name
#   merchant = Merchant.new({:name => 'John'}, nil)
#   assert_equal "John", merchant.name
# end
