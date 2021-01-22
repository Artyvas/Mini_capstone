class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :name, presence: true
  validates :price, numericality: true
  validates :price, numericality: {:greater_than => 0}
  validates :description, length: { minimum: 2 }
  validates :description, length: { maximum: 500 }
  # validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg)$}i, :message => "File must be in a valid format (.jpg, .png, jpeg)"
  # ^ This code "presents a security risk" - need to figure out a way to write this without causing the app to crash. 
  validates :quantity, :numericality => { :only_integer => true}

end
