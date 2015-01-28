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
              :transaction_repository

  def initialize
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

end