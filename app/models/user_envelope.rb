class UserEnvelope < ApplicationRecord
  belongs_to :user
  belongs_to :envelope

  def envelope_name
    env = Envelope.find_by(id: self.envelope_id)
    return env.name
  end

  def envelope_amount_spent
    envelope_amount = 0
    env = Envelope.find_by(id: self.envelope_id)
    env.categories.each do | cat |
      category_transactions = AccountTransaction.where(category_id: cat.id, user_id: user.id)
      category_transactions.each do | cat_tran |
        envelope_amount += cat_tran.amount
      end
    end
    return envelope_amount
  end

  def enevelope_amount_left
    amount_left = self.amount - envelope_amount_spent
    return amount_left
  end

  def categories_amount_spent
    categories_amount_spent = []
    env = Envelope.find_by(id: self.envelope_id)
    env.categories.each do | cat |
      category_transactions = AccountTransaction.where(category_id: cat.id, user_id: user.id)
      category_amount = 0
      category_transactions.each do | cat_tran |
        category_amount += cat_tran.amount
      end
      if cat.hierarchy_3 != "Null"
        category_name = cat.hierarchy_3
      elsif cat.hierarchy_2 != "Null"
        category_name = cat.hierarchy_2
      else
        category_name = cat.hierarchy_1
      end
      h = {name: category_name, amount: category_amount}
      categories_amount_spent.push(h)
    end
    return categories_amount_spent
  end

  def user_envelope_transactions
    envelope_transactions = []
    env = Envelope.find_by(id: self.envelope_id)
    env.categories.each do | cat |
      category_transactions = AccountTransaction.where(category_id: cat.id, user_id: user.id)
      category_transactions.each do | cat_tran |
        # clean_trans_date = cat_tran.date.to_date.to_formatted_s(:rfc822)
        # cat_tran.clean_trans_date = clean_trans_date
        envelope_transactions.push(cat_tran)
      end
    end
    return envelope_transactions
  end

  # def clean_trans_date
  #   date.to_date.to_formatted_s(:rfc822)
  # end
end
