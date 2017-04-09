class UserEnvelopeSerializer < ActiveModel::Serializer
  attributes :id, :envelope_name, :amount, :envelope_amount_spent, :enevelope_amount_left, :categories_amount_spent
  has_one :envelope
end
