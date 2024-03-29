### UTILITY METHODS ###

def build_company
  @company = FactoryGirl.build(:company, name: "Smart Ortho")
end

def create_company
  @company = FactoryGirl.create(:company)
end

def create_non_existent_company
  @company = FactoryGirl.create(:company, :name => "cideapothro")
  @company.destroy
end


### GIVEN ###

Given /^I am on the homepage$/ do
  visit '/'
end

Given /^there is a company listed$/ do
  create_company
end

Given /^I follow the company$/ do
  click_link @company.name
end

Given /^I follow the edit link for the company$/ do
  click_link 'Edit Company'
end

Given /^I am on the companies page$/ do
  visit '/companies'
end

### WHEN ###

When /^I add a new company that belongs to a category$/ do
  build_company 
  create_category
  click_on 'New Company'
  fill_in 'Name', :with => @company[:name]
  select @category[:name], :from => 'Category'
  click_button 'Submit'
end

When /^I make the changes in the company form$/ do
  fill_in 'Name', :with => @company.name 
  click_button 'Submit'
end

When /^I follow the delete link for the company$/ do
  create_admin
  sign_in
  click_link @company.name
  click_link "Delete Company"
end

When /^I search for a partial word$/ do
  visit '/companies'
  fill_in 'query', :with => 'orth'
  click_button 'Search'
end

When /^I search for a partial product word$/ do
  create_company
  visit company_path(@company)
  fill_in 'query', with: 'fanc'
  click_button 'Search'
end

When /^I search for a non\-existent company$/ do
  create_non_existent_company
  visit '/companies'
  fill_in 'query', :with => 'cideapothro'
  click_button 'Search'
end

When /^I visit the company page$/ do
  create_company
  visit company_path(@company)
end

### THEN ###

Then /^I should see the page for the newly created company$/ do
  create_company
  visit company_path(@company)
end

Then /^I should see the company name$/ do
  page.has_content?(@company.name)
end

Then /^I should see the category name the company belongs to$/ do
  page.has_content?(@company.category.name)
end

Then /^I should see a successful flash notice$/ do
  page.has_content?("Thanks for the submission!")
end

Then /^I should see the updated page for the company$/ do
  visit company_path(@company)
end

Then /^I should see a successful update message$/ do
  page.has_content?("Company has been updated.")
end

Then /^I should not see the edit link for the company$/ do
  page.should_not have_content("Edit Company")
end

Then /^I should see the edit link for the company$/ do
  page.has_content?("Edit Company")
end

Then /^I should not see the delete link for the company$/ do
  page.should_not have_content("Delete Company")
end

Then /^I should see the delete link for the company$/ do
  page.has_content?("Delete Company")
end

Then /^I should see a successful delete message for the company$/ do
  page.should have_content("Company has been deleted")
end

Then /^I should not see the deleted company$/ do
  page.should_not have_content(@company.name)
end

Then /^I should see the list of companies$/ do
  create_company
  Company.all.each do |c|
    page.has_content?(c.name)
  end
end

Then /^I should see the list of companies matching that partial word$/ do
  page.has_content?('orth')
end

Then /^I should not see the non\-existent company$/ do
  page.should_not have_content('cideapothro') 
end

Then /^I should see an unsuccesful search message$/ do
  page.should have_content("The company you were looking for could not be found")
end

Then /^I should see the list of products belonging to that company$/ do
  @company = FactoryGirl.create(:company_with_products)
  @products = @company.products
  @products.each do |product|
    page.has_content?(product.name)
  end
  page.has_content?(@company.name)
end

Then /^I should see the list of products matching that partial word$/ do
  page.has_content?('fanc')
end
