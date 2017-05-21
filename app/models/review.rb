class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :novel
  validates :title, presence: true, length: {minimum: 1}
end