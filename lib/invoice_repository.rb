class InvoiceRepository

  attr_reader :file_to_read

  def initialize(file_to_read)
    @file_to_read = file_to_read
    @invoice_parser = InvoiceParser.new
    @all = all
  end

  def all
    invoice_parser.make_invoices
  end


end