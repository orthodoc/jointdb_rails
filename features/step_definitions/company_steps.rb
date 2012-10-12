### UTILITY METHODS ###

def build_company
  @company = FactoryGirl.build(:company, name: "Smart Ortho")
end

def create_company
  @company = FactoryGirl.create(:company)
end

def build_category 
  @category = FactoryGirl.build(:category, name: "Manufacturer")
end

### GIVEN ###

Given /^I am on the homepage$/ do
  visit '/'
end

### WHEN ###

When /^I add a new company that belongs to a category$/ do
  build_company 
  build_category
  click_on 'New Company'
  fill_in 'Name', :with => @company[:name]
  select 'Manufacturer', :from => 'Category'
  click_button 'Submit'
end

### THEN ###

Then /^I should see the page for the newly created company$/ do
  create_company
  visit company_path(@company)
end
Then /^I should see the company name$/ do
  page.has_content?(@company.name)
end
Then /^I should see the category name$/ do
  page.has_content?(@company.category.name)
end
Then /^I should see a successful flash notice$/ do
  page.has_content?("Thanks for the submission!")
end
