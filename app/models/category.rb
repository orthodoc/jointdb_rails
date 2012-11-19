class Category < ActiveRecord::Base
  include PgSearch
  attr_accessible :name
  has_many :companies, :dependent => :delete_all
  validates :name,  :presence => true,
                    :uniqueness => true

  pg_search_scope :search, against: :name, using: {tsearch: {prefix: true, dictionary: "english"}}

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end
end
