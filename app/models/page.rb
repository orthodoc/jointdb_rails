class Page < ActiveRecord::Base
  attr_accessible :content, :name, :permalink
  validates :name,  :presence => true,
                    :uniqueness => true
  validates :permalink,   :presence => true,
                          :uniqueness => true
  validates :content,  :presence => true

  def to_param
    permalink
  end
end
