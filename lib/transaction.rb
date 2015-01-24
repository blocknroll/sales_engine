class Transaction
  
  attr_reader :id, :invoice_id, :cc_number, :cc_expir_date, :result, :created_at, :updated_at

  def initialize(data)
    @id = data[:id]
    @invoice_id = data[:invoice_id]
    @cc_number = data[:cc_number]
    @cc_expir_date = data[:cc_expir_date]
    @result = data[:result]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

end
