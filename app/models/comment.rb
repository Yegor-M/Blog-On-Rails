class Comment < ActiveRecord::Base
  belongs_to :article
  validates_length_of :body, :maximum => 1000, allow_blank: false
end
