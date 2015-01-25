class InvoiceItemRepository
  #its job is to hold the invoices once they've been created. so you have methods like all and so on that you can run.
  def initialize(file)
    @file = file

    @all = @invoice_item_parser.make_invoice_item(file)
  end

end
