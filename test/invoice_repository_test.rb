require_relative 'test_helper'

class InvoiceRepositoryTest < Minitest::Test

  attr_reader :invoice_repository, :sales_engine, :data

  def setup
    @data = "test/fixtures/invoices_fixtures.csv"
    @invoice_repository = InvoiceRepository.new('test/fixtures/invoices_fixtures.csv', self)
    @sales_engine = Minitest::Mock.new
  end

  def test_it_exists
    assert invoice_repository
  end

  def test_the_fixture_file_to_read_exists
    assert File.exist?(invoice_repository.file)
  end

  def test_it_creates_all_invoices
    assert 10, invoice_repository.all.count
  end

  def test_it_returns_a_random_instance
    test = []
    100.times { test << invoice_repository.random }
    test = test.uniq
    assert test.count > 1
  end

  def test_it_returns_a_find_by_id_match
    assert_equal "1", invoice_repository.find_by_id("1").id
  end

  def test_it_returns_a_find_by_customer_id_match
    assert_equal "1", invoice_repository.find_by_customer_id("1").customer_id
  end

  def test_it_returns_a_find_by_merchant_id_match
    assert_equal "26", invoice_repository.find_by_merchant_id("26").merchant_id
  end

  def test_it_returns_a_find_by_status_match
     assert_equal "shipped", invoice_repository.find_by_status("shipped").status
  end

  def test_it_returns_a_find_all_by_customer_id_match
    assert_equal 8, invoice_repository.find_all_by_customer_id("1").count
  end

  def test_it_returns_a_find_all_by_merchant_id_match
    assert_equal 2, invoice_repository.find_all_by_merchant_id("26").count
  end

  def test_it_returns_a_find_all_by_status_match
    assert_equal 10, invoice_repository.find_all_by_status("shipped").count
  end

  def test_method_calls_sales_engine
    invoice_repository = InvoiceRepository.new(data, sales_engine)
    sales_engine.expect(:find_items_by_invoice_id, nil, [1]) 
    invoice_repository.find_items_by_invoice_id(1)
    sales_engine.verify
  end

end
