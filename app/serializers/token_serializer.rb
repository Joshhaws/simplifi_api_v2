class TokenSerializer < ActiveModel::Serializer
  attributes :id, :plaid_access_token
  has_one :user
end
