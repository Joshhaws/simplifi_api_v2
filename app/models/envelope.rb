class Envelope < ApplicationRecord
  has_many :user_envelopes
  belongs_to :category
end
