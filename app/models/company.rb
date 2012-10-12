class Company < ActiveRecord::Base
  attr_accessible :category_id, :name
  belongs_to :category
  validates :name,  :presence => true,
                    :uniqueness => true
  validates :category,  :presence => true
end
