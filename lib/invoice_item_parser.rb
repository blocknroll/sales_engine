require_relative 'invoice_item_parser'

class InvoiceItemParser

  def make_invoice_item(file, sales_engine=nil)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse(contents, sales_engine)
  end

  private
  def parse(contents, sales_engine=nil)
    contents.map { |row| InvoiceItem.new({
      :id         => row[:id],
      :item_id    => row[:item_id],
      :invoice_id => row[:invoice_id],
      :quantity   => row[:quantity],
      :unit_price => row[:unit_price]
    }, sales_engine ) }
  end

end