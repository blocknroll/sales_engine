class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id

  def initialize(id, name, description, unit_price, merchant_id)
    @id = id
    @name = name
    @description = description
    @unit_price = unit_price
    @merchant_id = merchant_id
  end

end
