class Employee < ApplicationRecord
  validates :fname, presence: true
  validates :lname, presence: true
  validates :birthday, presence: true
  validates :email, uniqueness: true, allow_blank: true,
  format: {with: /\A\w+@(\w+.)+\w+\Z/}

  belongs_to :office, optional:true
  has_and_belongs_to_many :employee_tags
  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100,100]
    attachable.variant :microthumb, resize_to_limit: [50,50]
  end
  def name 
    "#{fname} #{lname}"

  end

  # def picture=(uploaded_file)
  #   destpath = Rails.root.join('uploads', 'employees', id, 'picture')
  #   FileUtils.mkdir_p(destpath)
  #   FileUtils.mv uploaded_file.tempfile.path, destpath.join(uploaded_file.original_filename)
  #   super uploaded_file.original_filename  
  # end

  # def picture_file
  #   Rails.root.join('uploads').join(picture)
  # end

end