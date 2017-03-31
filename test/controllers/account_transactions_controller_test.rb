require 'test_helper'

class AccountTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account_transaction = account_transactions(:one)
  end

  test "should get index" do
    get account_transactions_url, as: :json
    assert_response :success
  end

  test "should create account_transaction" do
    assert_difference('AccountTransaction.count') do
      post account_transactions_url, params: { account_transaction: { account_id: @account_transaction.account_id, address: @account_transaction.address, amount: @account_transaction.amount, category_id: @account_transaction.category_id, city: @account_transaction.city, date: @account_transaction.date, lat: @account_transaction.lat, lon: @account_transaction.lon, name: @account_transaction.name, pending: @account_transaction.pending, pending_transaction_id: @account_transaction.pending_transaction_id, state: @account_transaction.state, transaction_id: @account_transaction.transaction_id, transaction_type: @account_transaction.transaction_type, zip: @account_transaction.zip } }, as: :json
    end

    assert_response 201
  end

  test "should show account_transaction" do
    get account_transaction_url(@account_transaction), as: :json
    assert_response :success
  end

  test "should update account_transaction" do
    patch account_transaction_url(@account_transaction), params: { account_transaction: { account_id: @account_transaction.account_id, address: @account_transaction.address, amount: @account_transaction.amount, category_id: @account_transaction.category_id, city: @account_transaction.city, date: @account_transaction.date, lat: @account_transaction.lat, lon: @account_transaction.lon, name: @account_transaction.name, pending: @account_transaction.pending, pending_transaction_id: @account_transaction.pending_transaction_id, state: @account_transaction.state, transaction_id: @account_transaction.transaction_id, transaction_type: @account_transaction.transaction_type, zip: @account_transaction.zip } }, as: :json
    assert_response 200
  end

  test "should destroy account_transaction" do
    assert_difference('AccountTransaction.count', -1) do
      delete account_transaction_url(@account_transaction), as: :json
    end

    assert_response 204
  end
end
