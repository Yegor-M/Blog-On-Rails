class ArticleSerializer < ActiveModel::Serializer
  has_many :comments
  attributes :id, :title, :description, :user_id
end
