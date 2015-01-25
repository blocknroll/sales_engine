class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  # To do: implement hash

  def initialize(id, first_name, last_name, created_at, updated_at)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @created_at = created_at
    @updated_at = updated_at
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
