require 'test_helper'

class EnvelopesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @envelope = envelopes(:one)
  end

  test "should get index" do
    get envelopes_url, as: :json
    assert_response :success
  end

  test "should create envelope" do
    assert_difference('Envelope.count') do
      post envelopes_url, params: { envelope: { name: @envelope.name } }, as: :json
    end

    assert_response 201
  end

  test "should show envelope" do
    get envelope_url(@envelope), as: :json
    assert_response :success
  end

  test "should update envelope" do
    patch envelope_url(@envelope), params: { envelope: { name: @envelope.name } }, as: :json
    assert_response 200
  end

  test "should destroy envelope" do
    assert_difference('Envelope.count', -1) do
      delete envelope_url(@envelope), as: :json
    end

    assert_response 204
  end
end
