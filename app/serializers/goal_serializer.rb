class GoalSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :note, :date, :user
end
