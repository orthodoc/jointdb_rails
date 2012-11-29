class Product < ActiveRecord::Base
  include PgSearch
  attr_accessible :company_id, :name
  belongs_to :company
  validates :name,  presence: true,
                    uniqueness: {scope: :company_id}
  validates :company, presence: true

  pg_search_scope :search, against: :name, using: {tsearch: {prefix: true, dictionary: "english"}}

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end
end
