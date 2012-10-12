class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :companies, :dependent => :delete_all
  validates :name,  :presence => true,
                    :uniqueness => true
end
