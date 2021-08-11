class Blog < ApplicationRecord
    validates :title, presence: true, length: {
    in: 5..10
    }, uniqueness: true
    validates :content, presence: true
    # validates title: { message: "%{title} must be a number" }
end
