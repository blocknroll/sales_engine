class Customer
  attr_reader :id, 
              :first_name, 
              :last_name,  
              :created_at, 
              :updated_at, 
              :customer_repo

  def initialize(data, customer_repo=nil)
    @id             = data[:id]
    @first_name     = data[:first_name]
    @last_name      = data[:last_name]
    @created_at     = data[:created_at]
    @updated_at     = data[:updated_at]
    @customer_repo  = customer_repo
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def sales_engine
    customer_repo.parent
  end

  def invoices
    sales_engine.startup
    sales_engine.invoice_repository.find_all_by_customer_id(id)
  end



end
