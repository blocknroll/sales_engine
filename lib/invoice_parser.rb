require 'csv'
require_relative 'invoice'

class InvoiceParser

  def make_invoices(file)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse(contents)
  end

  private
  def parse(contents)
    contents.map { |row| Invoice.new({
      :id => row[:id],
      :customer_id => row[:customer_id],
      :merchant_id => row[:merchant_id],
      :status => row[:status],
      :created_at => row[:created_at],
      :updated_at => row[:updated_at]
      })}
  end

end