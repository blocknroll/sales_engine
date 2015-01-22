class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id

  def initialize(row)
    @id = row[:id].to_i
    @name = row[:name]
    @description = description
    @unit_price = unit_price
    @merchant_id = merchant_id
  end

end
