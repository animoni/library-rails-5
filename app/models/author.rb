class Author < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  
  validates_format_of :first_name, :last_name, :with => /\A[a-z]+\z/i
  def full_name_index(first,last)
    "#{first} #{last}"
  end

end
