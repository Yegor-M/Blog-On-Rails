class Article < ActiveRecord::Base
  has_many :comments
  validates_length_of :title, :maximum => 100, allow_blank: false
end
