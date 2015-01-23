require_relative 'test_helper'

class InvoiceRepositoryTest < Minitest::Test

  def setup
    @invoice_repo = InvoiceRepository.new('test/fixtures/invoices_fixtures.csv')
  end

  def test_it_exists
    assert @invoice_repo
  end

  def test_the_fixture_file_to_read_exists
    assert File.exist?(@invoice_repo.file_to_read)
  end

  def test_it_creates_invoices
    assert 10, @invoice_repo.all.count
  end

  #the invoice repo holds all the invoices. so first you need to create an all method that pulls in the files from the parser. I'm still not entirely sure why we need a parameter on the new class but we do so... 


end