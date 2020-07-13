class AddCategorytoTopic < ActiveRecord::Migration[6.0]
  def change
    add_reference :topics, :category,  references: :categories, index: true

    # Just like the belongs_to contained class_name: :User, the foreign key
    # also needs a specific custom column name as :creator_id
    add_foreign_key :topics, :categories
  end

end
