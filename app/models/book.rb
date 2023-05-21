class Book < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {minimum: 3, maximum:50}
    validates :description, presence: true, length: {minimum: 6, maximum:200}
    validates :price, presence: true
    validates :count, presence: true

end