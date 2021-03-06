class InvoiceItem

  attr_reader :id, 
              :item_id, 
              :invoice_id, 
              :quantity, 
              :unit_price,
              :invoice_repo

  def initialize(data, invoice_repo=nil)
    @id           = data[:id]
    @item_id      = data[:item_id]
    @invoice_id   = data[:invoice_id]
    @quantity     = data[:quantity]
    @unit_price   = data[:unit_price]
    @invoice_repo = invoice_repo
  end

end