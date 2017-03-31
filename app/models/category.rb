class Category < ApplicationRecord
  belongs_to :envelope
  belongs_to :account_transaction
end
