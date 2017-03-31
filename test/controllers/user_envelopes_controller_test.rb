require 'test_helper'

class UserEnvelopesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_envelope = user_envelopes(:one)
  end

  test "should get index" do
    get user_envelopes_url, as: :json
    assert_response :success
  end

  test "should create user_envelope" do
    assert_difference('UserEnvelope.count') do
      post user_envelopes_url, params: { user_envelope: { amount: @user_envelope.amount, envelope_id: @user_envelope.envelope_id, user_id: @user_envelope.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_envelope" do
    get user_envelope_url(@user_envelope), as: :json
    assert_response :success
  end

  test "should update user_envelope" do
    patch user_envelope_url(@user_envelope), params: { user_envelope: { amount: @user_envelope.amount, envelope_id: @user_envelope.envelope_id, user_id: @user_envelope.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_envelope" do
    assert_difference('UserEnvelope.count', -1) do
      delete user_envelope_url(@user_envelope), as: :json
    end

    assert_response 204
  end
end
