class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :update, :destroy]
  skip_before_action :authenticate, only: [:access_token, :get_access_token, :plaid_accounts, :plaid_item, :plaid_transactions, :create_public_token]

  # GET /accounts
  def index
    @accounts = @current_user.accounts

    render json: @accounts
  end

  # GET /accounts/1
  def show
    render json: @account
  end

  # POST /accounts
  def create
    @account = Account.new(account_params.merge(user:@current_user))

    if @account.save
      render json: @account, status: :created, location: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params.merge(user:@current_user))
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
  end

  #plaid functions
  def set_access_token
    puts ">>>>>>>>>>>>>>>>>>>>"
    puts "set_access_token"
    puts ">>>>>>>>>>>>>>>>>>>>"
    access_token = params['access_token']
    puts 'access token:' + access_token
    render json: { error: false }
  end

  def get_access_token
    client = Plaid::Client.new(env: :sandbox,
                           client_id: "58d324444e95b819440e4877",
                           secret: "92f24058f1bbfd1ee613a5a98b3f0d",
                           public_key: "4181b5e7e3476f2974824d3a1d4e52")


    exchange_token_response = client.item.public_token.exchange(params['public_token'])
    access_token = exchange_token_response['access_token']

    # @current_user = User.find_by(token: 'KXT02Okxt0M9VWpr9ZRR4wtt')
    PlaidAccessToken.create(user_id: @current_user.id, plaid_access_token: access_token)

    #code that takes the response and populates our db
    plaid_accounts
    #plaid_transactions
  end

  def plaid_accounts
    client = Plaid::Client.new(env: :sandbox,
                           client_id: "58d324444e95b819440e4877",
                           secret: "92f24058f1bbfd1ee613a5a98b3f0d",
                           public_key: "4181b5e7e3476f2974824d3a1d4e52")
    debugger
    auth_response = client.auth.get(@current_user.plaid_access_tokens.last.plaid_access_token)
    institution_response = client.institutions.get_by_id(auth_response['item']['institution_id'])
    auth_response['accounts'].each do |a|
      Account.create!(user: @current_user, account_id: a['account_id'], available_balance: a['balances']['available'], current_balance: a['balances']['current'], name: a['name'], official_name: a['official_name'], account_subtype: a['subtype'], account_type: a['type'], institution_name: institution_response['institution']['name'])
    end
  end

  def plaid_transactions
    client = Plaid::Client.new(env: :sandbox,
                           client_id: "58d324444e95b819440e4877",
                           secret: "92f24058f1bbfd1ee613a5a98b3f0d",
                           public_key: "4181b5e7e3476f2974824d3a1d4e52")
    now = Date.today
    thirty_days_ago = (now - 30)
    transactions_response = client.transactions.get(@current_user.plaid_access_tokens.last.plaid_access_token, thirty_days_ago, now)
    transactions_response['transactions'].each do |t|
      AccountTransaction.create!(account_id: t['account_id'], user_id: @current_user.id, transaction_id: t['transaction_id'], category_id: t['category_id'], amount:t['amount'], transaction_type: t['transaction_type'], date: t['date'], pending: t['pending'], pending_transaction_id: t['pending_transaction_id'], city: t['city'], state: t['state'], zip: t['zip'], lat: t['lat'], lon:t['lon'], name: t['name'], address: t['address'])
    end
  end

  def update_account_transactions
    client = Plaid::Client.new(env: :sandbox,
                           client_id: "58d324444e95b819440e4877",
                           secret: "92f24058f1bbfd1ee613a5a98b3f0d",
                           public_key: "4181b5e7e3476f2974824d3a1d4e52")
     now = Date.today
     thirty_days_ago = (now - 30)
     @current_user.plaid_access_tokens.each do |user_token|
       transactions_response = client.transactions.get(user_token.plaid_access_token, thirty_days_ago, now)
       transactions_response['transactions'].each do |t|
         AccountTransaction.create!(account_id: t['account_id'], transaction_id: t['transaction_id'], user_id: @current_user, category_id: t['category_id'], amount:t['amount'], transaction_type: t['transaction_type'], date: t['date'], pending: t['pending'], pending_transaction_id: t['pending_transaction_id'], city: t['city'], state: t['state'], zip: t['zip'], lat: t['lat'], lon:t['lon'], name: t['name'], address: t['address'], )
       end
     end
  end

  def plaid_item
    client = Plaid::Client.new(env: :sandbox,
                           client_id: "58d324444e95b819440e4877",
                           secret: "92f24058f1bbfd1ee613a5a98b3f0d",
                           public_key: "4181b5e7e3476f2974824d3a1d4e52")
    puts ">>>>>>>>>>>>>>>>>>>>"
    puts "plaid_item"
    puts ">>>>>>>>>>>>>>>>>>>>"
    @current_user = User.find_by(token: '9kYwTWpZz6QJWlB6XvjnZwtt')
    item_response = client.item.get(@current_user.plaid_access_token)
    institution_response = client.institutions.get_by_id(item_response['item']['institution_id'])
    puts institution_response
    render json: { item: item_response['item'], institution: institution_response['institution'] }
  end

  def create_public_token
    client = Plaid::Client.new(env: :sandbox,
                           client_id: "58d324444e95b819440e4877",
                           secret: "92f24058f1bbfd1ee613a5a98b3f0d",
                           public_key: "4181b5e7e3476f2974824d3a1d4e52")
    puts ">>>>>>>>>>>>>>>>>>>>"
    puts "create_public_token"
    puts ">>>>>>>>>>>>>>>>>>>>"
    public_token_response = client.item.public_token.exchange(access_token)
    render json: public_token_response
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def account_params
      params.require(:account).permit(:account_id, :name, :available_balance, :current_balance, :account_type, :account_subtype, :user_id)
    end
end
