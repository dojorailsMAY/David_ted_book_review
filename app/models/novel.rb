class Novel < ActiveRecord::Base
  belongs_to :author
  has_many :reviews
  validates :title, presence: true, length: {in: 1..26}
end
