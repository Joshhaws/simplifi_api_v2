class CategorySerializer < ActiveModel::Serializer
  attributes :id, :group, :hierarchy_1, :hierarchy_2, :hierarchy_3
  has_one :envelope
end
