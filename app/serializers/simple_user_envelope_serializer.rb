class SimpleUserEnvelopeSerializer < ActiveModel::Serializer
  attributes :envelope_name, :envelope_amount_spent
end
