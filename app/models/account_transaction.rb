class AccountTransaction < ApplicationRecord
  belongs_to :account, foreign_key: :account_id, primary_key: :account_id

  def clean_trans_date
    transaction_date.to_date.to_formatted_s(:rfc822)
  end

  def account_name
    self.account.institution_name
  end

  def category_name
    self.category.name
  end
end
