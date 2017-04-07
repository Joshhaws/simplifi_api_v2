class AccountTransactionSerializer < ActiveModel::Serializer
  attributes :id, :transaction_id, :amount, :transaction_type, :date, :pending, :pending_transaction_id, :address, :city, :state, :zip, :lat, :lon, :name, :category_id
end
