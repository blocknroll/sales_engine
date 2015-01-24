class InvoiceItem

  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price

  def initialize(id, item_id, invoice_id, quantity, unit_price)
    @id = id
    @item_id = item_id
    @invoice_id = invoice_id
    @quantity = quantity
    @unit_price = unit_price
  end

end

  # attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price

  # def initialize(data)
  #   @id = data[:id].to_i
  #   @item_id = item_id
  #   @invoice_id = invoice_id
  #   @quantity = quantity
  #   @unit_price = unit_price
  # end