class Transaction
  attr_reader :id, :invoice_id, :cc_number, :cc_expir_date, :result

  def initialize(data)
    @id = data[:id]
    @invoice_id = data[:invoice_id]
    @cc_number = data[:cc_number]
    @cc_expir_date = data[:cc_expir_date]
    @result = data[:result]
  end

end
