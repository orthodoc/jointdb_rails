### UTILITY METHODS ###

def create_category
  @category = FactoryGirl.create(:category)
end

def build_category 
  @category = FactoryGirl.build(:category, name: "Manufacturer")
end

### GIVEN ###

Given /^there is a category listed$/ do
  create_category
end

Given /^I am on the categories page$/ do
  visit '/categories'
end

### When ###

When /^I add a new category$/ do
  build_category
  click_on 'New Category'
  fill_in 'Name', :with => @category[:name]
  click_button 'Submit' 
end

When /^I visit new category page$/ do
  visit '/categories/new'
end

When /^I follow the category$/ do
  create_category
  visit '/categories'
  click_link @category[:name]
end

When /^I visit the categories page$/ do
  step %{I am on the categories page}
end

### THEN ###

Then /^I should see the page for the newly created category$/ do create_category
  visit category_path(@category)
end

Then /^I should see the category name$/ do
  page.should have_content @category[:name]
end

Then /^I should not see the new category link$/ do
  page.should_not have_content("New Category")
end

Then /^I should see an admin flash message$/ do
  page.should have_content("You have to log in as admin to perform this action")
end

Then /^I should be on the homepage$/ do
  step %{I am on the homepage}
end

Then /^I should see the edit link for the category$/ do
  page.should have_content("Edit Category")
end

Then /^I follow the edit link for the category$/ do
  click_link "Edit Category"
end

Then /^I make changes in the category form$/ do
  fill_in 'Name', :with => @category.name
  click_button 'Submit'
end

Then /^I should see the updated page for the category$/ do
  visit category_path(@category)
end

Then /^I follow the delete link for the category$/ do
  create_admin
  sign_in
  visit '/categories'
  click_link @category[:name]
  click_link "Delete Category"
end

Then /^I should see the delete link for the category$/ do
  page.should have_content("Delete Category")
end

Then /^I should see a successful category delete message$/ do
  page.should have_content("Category has been deleted")
end

Then /^I should not see the deleted category$/ do
  page.should_not have_content @category[:name]
end
