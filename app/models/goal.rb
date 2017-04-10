class Goal < ApplicationRecord
  belongs_to :user

  def clean_goal_date
    date.to_date.to_formatted_s(:rfc822)
  end
end
