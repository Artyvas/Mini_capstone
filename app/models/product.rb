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
  

  belongs_to :supplier
end
