class UserEnvelope < ApplicationRecord
  belongs_to :user
  belongs_to :envelope

  def get_envelope_transactions
    
  end
end
