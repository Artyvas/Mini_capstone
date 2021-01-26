class Product < ApplicationRecord
  def is_discounted?
    price <= 10
    # Why is the discount price a fixed number? Strange... I would imagine that it would instead be a variable that is set equal to the original price.
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  validates :name, presence: true
  validates :price, numericality: true
  validates :price, numericality: { :greater_than => 0 }
  validates :description, length: { minimum: 2 }
  validates :description, length: { maximum: 500 }
  # validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg)$}i, :message => "File must be in a valid format (.jpg, .png, jpeg)"
  # ^ This code "presents a security risk" - need to figure out a way to write this without causing the app to crash.
  validates :quantity, :numericality => { :only_integer => true }

  belongs_to :supplier
  has_many :orders
end
