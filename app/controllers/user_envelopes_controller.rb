class UserEnvelopesController < ApplicationController
  before_action :set_user_envelope, only: [:show, :update, :destroy]

  # GET /user_envelopes
  def index
    @user_envelopes = @current_user.user_envelopes

    render json: @user_envelopes
  end

  def get_envelopes
    @user_envelopes = @current_user.user_envelopes

    render json: @user_envelopes, each_serializer: SimpleUserEnvelopeSerializer
  end

  # GET /user_envelopes/1
  def show
    render json: @user_envelope
  end

  # POST /user_envelopes
  def create
    @user_envelope = UserEnvelope.new(user_envelope_params.merge(user: @current_user))

    if @user_envelope.save
      render json: @user_envelope, status: :created, location: @user_envelope
    else
      render json: @user_envelope.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_envelopes/1
  def update
    if @user_envelope.update(user_envelope_params)
      render json: @user_envelope
    else
      render json: @user_envelope.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_envelopes/1
  def destroy
    @user_envelope.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_envelope
      @user_envelope = UserEnvelope.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_envelope_params
      params.require(:user_envelope).permit(:amount, :user_id, :envelope_id)
    end
end
