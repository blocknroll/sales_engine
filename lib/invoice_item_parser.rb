class InvoiceItemParser

  def make_invoice_item(file)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse(contents)
  end

  private
  def parse(contents)
    contents.map { |row| InvoiceItem.new({
      :id         => row[:id],
      :item_id    => row[:item_id],
      :invoice_id => row[:invoice_id],
      :quantity   => row[:quantity],
      :unit_price => row[:unit_price]
    } ) }
  end

end