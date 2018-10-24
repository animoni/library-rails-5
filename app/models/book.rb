class Book < ApplicationRecord
  
  validates :title, presence: :true, length: { maximum: 50 }
  validates :description, presence: :true, length: { maximum: 255, too_long: "%{count} characters is the maximum allowed" }
end
