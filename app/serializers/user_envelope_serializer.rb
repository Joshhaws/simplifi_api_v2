class UserEnvelopeSerializer < ActiveModel::Serializer
  attributes :id, :amount
  has_one :envelope
end
