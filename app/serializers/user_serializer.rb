class UserSerializer < ActiveModel::Serializer
  attributes :overall_budget, :overall_spent, :id, :first_name, :last_name, :email, :password_digest, :enabled, :email_preferences, :notification_preferences, :token
end
