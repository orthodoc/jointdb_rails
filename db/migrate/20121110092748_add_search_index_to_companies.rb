class AddSearchIndexToCompanies < ActiveRecord::Migration
  def change
    execute "create index companies_name on companies using gin(to_tsvector('english', name))"
  end
end
