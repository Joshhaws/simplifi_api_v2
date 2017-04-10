class AccountSerializer < ActiveModel::Serializer
  attributes :id, :account_id, :name, :available_balance, :current_balance, :account_type, :account_subtype
end
