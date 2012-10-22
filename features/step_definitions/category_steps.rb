### UTILITY METHODS ###

def create_category
  @category = FactoryGirl.create(:category)
end

def build_category 
  @category = FactoryGirl.build(:category, name: "Manufacturer")
end

### When ###

When /^I add a new category$/ do
  build_category
  click_on 'New Category'
  fill_in 'Name', :with => @category[:name]
  click_button 'Submit' 
end


### THEN ###

Then /^I should see the page for the newly created category$/ do create_category
  visit category_path(@category)
end

Then /^I should see the category name$/ do
  page.should have_content @category[:name]
end
