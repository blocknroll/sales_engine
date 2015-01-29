# require_relative 'customer_repository'
# require_relative 'invoice_repository'
# require_relative 'invoiceitem_repository'
# require_relative 'item_repository'
# require_relative 'merchant_repository'
# require_relative 'transaction_repository'

class SalesEngine

  attr_reader :merchant_repository, 
              :invoice_repository,
              :item_repository,
              :invoice_item_repository,
              :customer_repository,
              :transaction_repository,
              :filepath


  def initialize(filepath=nil)
    @filepath          = filepath
    @merchant_file     = 'test/fixtures/merchants_fixtures.csv'
    @invoice_file      = 'test/fixtures/invoices_fixtures.csv'
    @item_file         = 'test/fixtures/items_fixtures.csv'
    @item_invoice_file = 'test/fixtures/invoice_items_fixtures.csv'
    @customer_file     = 'test/fixtures/customers_fixtures.csv'
    @transaction_file  = 'test/fixtures/transactions_fixtures.csv'
  end

  def startup
    @merchant_repository      = MerchantRepository.new(@merchant_file, self)
    @invoice_repository       = InvoiceRepository.new(@invoice_file, self)
    @item_repository          = ItemRepository.new(@item_file, self)
    @invoice_item_repository  = InvoiceItemRepository.new(@item_invoice_file, self)
    @customer_repository      = CustomerRepository.new(@customer_file, self)
    @transaction_repository   = TransactionRepository.new(@transaction_file, self)
  end


  def find_invoices_by_customer_id(id)
    item_repository.find_all_by_id(id)
  end

  def find_transactions_by_invoice_id(id)
    transaction_repository.find_all_by_invoice_id(id)
  end

  def find_invoice_items_by_invoice_id
    invoice_item_repository.find_all_by_invoice_id(id)
  end

  def find_items_by(id)
    sales_engine.find_items_by_merchant_id(id)
  end

  def find_invoices_by(id)
    sales_engine.find_invoices_by_merchant_id(id)
  end

  def find_items_by_invoice_id(id)
    items = invoice_item_repository.find_all_by_invoice_id(id) 
    items.map { |e| item_repository.find_by_id(e.item_id)}
    item_repository.find_by_id(invoice_item.item_id)
  end

  def find_by_customer_id(id)
    customer_repository.find_by_id(id)
  end

  def find_by_merchant_id(id)
    merchant_repository.find_by_id(id)
  end

  def find_invoice(id)
    invoice_repository.find_by_id(id)
  end

  def find_invoice_items_by_item_id(id)
    invoice_item_repository.find_by_id(id)
  end

  def find_merchant_by_merchant_id(id)
    merchant_repository.find_by_id(id)
  end


  # sales_engine = SalesEngine.new(nil)
  # sales_engine.startup

end