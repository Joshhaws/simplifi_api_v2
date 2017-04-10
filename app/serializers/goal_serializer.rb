class GoalSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :note, :date, :user, :clean_goal_date
end
