class User < ApplicationRecord
    has_many :plaid_access_tokens
    has_many :accounts
    has_many :account_transactions, through: :accounts
    has_many :goals
    has_many :user_envelopes

    has_secure_password

    validates :email, uniqueness: true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    before_create do |user|
      user.token = user.generate_api_key
    end

    def generate_api_key
      loop do
        token = SecureRandom.base64.tr('+/=', 'Qrt')
        break token unless User.exists?(token: token)
      end
    end
end
