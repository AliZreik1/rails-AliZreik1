class Employee < ApplicationRecord
  validates :fname, presence: true
  validates :lname, presence: true
  validates :birthday, presence: true
  validates :email, uniqueness: true, allow_blank: true,
  	format: {with: /\A\w+@(\w+.)+\w+\Z/}

  belongs_to :office, optional:true
  has_and_belongs_to_many :employee_tags
  has_many :comments, as: :commentable, dependent: :destroy
def name 
  "#{fname} #{lname}"

end

end