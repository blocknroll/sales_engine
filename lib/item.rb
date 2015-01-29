class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :item_repo

  def initialize(data, item_repo=nil)
    @id           = data[:id]
    @name         = data[:name]
    @description  = data[:description]
    @unit_price   = data[:unit_price]
    @merchant_id  = data[:merchant_id]
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
    @item_repo    = item_repo
  end

  def invoice_items
    item_repo.find_invoice_items_by_item_id(id)
  end

  def merchant
    item_repo.find_merchant_by_merchant_id(id)
  end
end
