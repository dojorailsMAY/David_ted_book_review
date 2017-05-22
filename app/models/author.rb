class Author < ActiveRecord::Base
    has_many :novels
    validates :name, presence: true,length:{minimum: 1}
end
