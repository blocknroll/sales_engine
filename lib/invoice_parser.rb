require 'csv'
require_relative 'invoice'

class InvoiceParser

  def make_invoice(file, sales_engine=nil)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse(contents, sales_engine)
  end

  private
  def parse(contents, sales_engine=nil)
    contents.map { |row| Invoice.new({
      :id           => row[:id],
      :customer_id  => row[:customer_id],
      :merchant_id  => row[:merchant_id],
      :status       => row[:status],
      :created_at   => row[:created_at],
      :updated_at   => row[:updated_at]
      }, sales_engine ) }
  end

end
