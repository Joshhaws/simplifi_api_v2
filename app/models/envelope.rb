class Envelope < ApplicationRecord
  has_many :user_envelopes
  has_many :categories
end
