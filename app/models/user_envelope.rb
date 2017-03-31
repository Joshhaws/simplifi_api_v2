class UserEnvelope < ApplicationRecord
  belongs_to :user
  belongs_to :envelope
end
