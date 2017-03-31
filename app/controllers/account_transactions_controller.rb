class AccountTransactionsController < ApplicationController
  before_action :set_account_transaction, only: [:show, :update, :destroy]

  # GET /account_transactions
  def index
    @account_transactions = @current_user.account_transactions

    render json: @account_transactions
  end

  # GET /account_transactions/1
  def show
    render json: @account_transaction
  end

  # POST /account_transactions
  def create
    @account_transaction = AccountTransaction.new(account_transaction_params)

    if @account_transaction.save
      render json: @account_transaction, status: :created, location: @account_transaction
    else
      render json: @account_transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /account_transactions/1
  def update
    if @account_transaction.update(account_transaction_params)
      render json: @account_transaction
    else
      render json: @account_transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /account_transactions/1
  def destroy
    @account_transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_transaction
      @account_transaction = AccountTransaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def account_transaction_params
      params.require(:account_transaction).permit(:transaction_id, :amount, :transaction_type, :date, :pending, :pending_transaction_id, :address, :city, :state, :zip, :lat, :lon, :name, :category_id, :account_id)
    end
end
