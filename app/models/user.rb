class User < ApplicationRecord
    has_many :plaid_access_tokens
    has_many :accounts
    has_many :account_transactions
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

    def overall_budget
      self.user_envelopes.sum(:amount)
    end

    def overall_spent
      overall_spent = 0
      self.user_envelopes.each do | user_env |
        envelope_amount = 0
        env = Envelope.find_by(id: user_env.envelope_id)
        env.categories.each do | cat |
          category_transactions = AccountTransaction.where(category_id: cat.id, user_id: self.id)
          category_transactions.each do | cat_tran |
            envelope_amount += cat_tran.amount
          end
        end
        overall_spent += envelope_amount
      end
      return overall_spent
    end
end
