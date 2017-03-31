class PlaidAcessTokensController < ApplicationController
  before_action :set_token, only: [:show, :update, :destroy]

  # GET /tokens
  def index
    @tokens = PlaidAcessToken.all

    render json: @tokens
  end

  # GET /tokens/1
  def show
    render json: @token
  end

  # POST /tokens
  def create
    @token = PlaidAcessToken.new(token_params)

    if @token.save
      render json: @token, status: :created, location: @token
    else
      render json: @token.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tokens/1
  def update
    if @token.update(token_params)
      render json: @token
    else
      render json: @token.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tokens/1
  def destroy
    @token.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_token
      @token = PlaidAcessToken.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def token_params
      params.require(:token).permit(:plaid_access_token, :user_id)
    end
end
