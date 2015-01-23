require 'csv'
require_relative 'invoice'

class InvoiceParser

  def make_invoices(invoice_file)
    contents = CSV.open(invoice_file, headers: true, header_converters: :symbol)
    parse(contents)
  end

  private
  def parse(contents)
    contents.map { |row| Invoice.new({
      :id => row[:id],
      :customer_id => row[:customer_id],
      :merchant_id => row[:merchant_id],
      :status => row[:status]
      })}
  end

end