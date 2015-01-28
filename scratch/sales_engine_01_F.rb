class SalesEngine

  attr_reader :merchant_repository,
              :invoice_repository,
              :item_repository,
              :invoice_item_repository,
              :customer_repository,
              :transaction_repository

  def startup
    @merchant_repository = MerchantRepository.new('test/fixtures/merchants_fixtures.csv', self)
    @invoice_repository = InvoiceRepository.new('test/fixtures/invoices_fixtures.csv')
    @item_repository = ItemRepository.new('test/fixtures/items_fixtures.csv')
    @invoice_item_repository = InvoiceItemRepository.new('test/fixtures/invoice_items_fixtures.csv')
    @customer_repository = CustomerRepository.new('test/fixtures/customers_fixtures.csv', self)
    @transaction_repository = TransactionRepository.new('test/fixtures/transactions_fixtures.csv')
  end

  def find_items_using_merchant(id)
    15
  end

end
