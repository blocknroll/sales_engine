require_relative 'test_helper'

class SalesEngineTest < Minitest::Test

  attr_reader :engine

  def setup
    @engine = SalesEngine.new
    engine.startup
  end

  def test_it_has_a_merchant_repo_method
    assert engine.merchant_repository.is_a? MerchantRepository
  end

  def test_it_has_an_invoice_repo_method
    assert engine.invoice_repository.is_a? InvoiceRepository
  end

  def test_it_has_an_invoice_item_repo_method
    assert engine.invoice_item_repository.is_a? InvoiceItemRepository
  end

  def test_it_has_an_item_repo_method
    assert engine.item_repository.is_a? ItemRepository
  end

  def test_it_has_an_customer_repo_method
    assert engine.customer_repository.is_a? CustomerRepository
  end

  def test_it_has_an_transaction_repo_method
    assert engine.transaction_repository.is_a? TransactionRepository
  end

  def test_it_can_find_a_random_merchant
    assert engine.merchant_repository.random.is_a? Merchant
  end



  # RELATIONSHIPS

  def test_it_can_find_items_using_id
    assert_equal 15, engine.find_items_using_merchant("1")
  end



# engine = SalesEngine.new
# engine.startup

# engine.merchant_repository
# engine.invoice_repository
# engine.item_repository
# engine.invoice_item_repository
# engine.customer_repository
# engine.transaction_repository

end
