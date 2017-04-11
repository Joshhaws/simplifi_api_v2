class UserEnvelopeSerializer < ActiveModel::Serializer
  attributes :id, :get_envelope_id, :envelope_name, :amount, :envelope_amount_spent, :enevelope_amount_left, :categories_amount_spent, :user_envelope_transactions
  has_one :envelope
end
