class Company < ActiveRecord::Base
  include PgSearch
  attr_accessible :category_id, :name
  belongs_to :category
  has_many :products
  validates :name,  :presence => true,
                    :uniqueness => true
  validates :category,  :presence => true
  
  pg_search_scope :search, against: :name, using: {tsearch: {prefix: true, dictionary: "english"}}

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end
end
