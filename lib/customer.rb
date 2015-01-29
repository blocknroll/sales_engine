class Customer
  attr_reader :id, 
              :first_name, 
              :last_name,  
              :created_at, 
              :updated_at, 
              :customer_repository

  def initialize(data, customer_repository=nil)
    @id                   = data[:id]
    @first_name           = data[:first_name]
    @last_name            = data[:last_name]
    @created_at           = data[:created_at]
    @updated_at           = data[:updated_at]
    @customer_repository  = customer_repository
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def invoices
    customer_repository.find_invoices_by_id(id)
  end



end
