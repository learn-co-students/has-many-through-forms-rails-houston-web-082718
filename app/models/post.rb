class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  # Now, when we do mass assignment, our Post model will call a method called
  # categories_attributes=. Let's add that method to our model using the 
  # accepts_nested_attributes_for macro.
  accepts_nested_attributes_for :categories


  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      # self.post_categories.build(category: category)
      self.categories << category
    end
  end

end