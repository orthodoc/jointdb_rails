class AddSearchIndexToProducts < ActiveRecord::Migration
  def change
    execute "create index products_name on products using gin(to_tsvector('english', name))"
  end
end
