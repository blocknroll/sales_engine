require_relative 'test_helper'

class TransactionTest < Minitest::Test

  attr_reader :transaction

  def setup
    data = {
      :id             => 1,
      :invoice_id     => 1,
      :cc_number      => 4654405418249632,
      :cc_expir_date  => nil,
      :result         => "success",
      :created_at     => "2012-03-27 14:54:09 UTC",
      :updated_at     => "2012-03-27 14:54:09 UTC"
    }
    @transaction = Transaction.new(data)
  end

  def test_it_exists
    assert transaction
  end

  def test_it_has_an_id
    assert_equal 1, transaction.id
  end

  def test_it_has_an_invoice_id
    assert_equal 1, transaction.invoice_id
  end

  def test_it_has_a_cc_number
    assert_equal 4654405418249632, transaction.cc_number
  end

  def test_it_has_a_cc_expir_date
    assert_equal nil, transaction.cc_expir_date
  end

   def test_it_has_a_result
    assert_equal "success", transaction.result
  end

end