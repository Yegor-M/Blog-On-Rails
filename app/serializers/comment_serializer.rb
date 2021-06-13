class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :article_id
end
