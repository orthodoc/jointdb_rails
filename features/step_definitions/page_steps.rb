### UTILITY METHODS ###

def build_page
  @page = FactoryGirl.build(:page)
end

def create_page
  @page = FactoryGirl.create(:page)
end

def non_existent_page
  @page = FactoryGirl.create(:page, :permalink => "egap")
  @page.destroy
end

### GIVEN ###

Given /^I am on the pages page$/ do
  visit '/pages'
end

Given /^I am visiting a particular page$/ do
  create_page
  visit (page_path(Page.first))
end

Given /^I visit a non\-existent page$/ do
  non_existent_page
  visit '/egap'
end

### THEN ###

Then /^I should see a list of pages$/ do
  build_page
  Page.all.each do |p|
    page.has_content?(p.name)
  end
end

Then /^I should see Show, Edit and Destroy$/ do
  %w{Show, Edit, Destroy}.each do |w|
    page.has_content?(w)
  end
end

Then /^I should be on the home page$/ do
  %{I am on the homepage}
end

Then /^I should not see Show, Edit and Destroy$/ do
  %w{Show, Edit, Destroy}.each do |w|
    page.should_not have_content(w)
  end
end

Then /^I should see the name of the page$/ do
  page.has_content?(@page.name)
end

Then /^I should see the contents of the page$/ do
  page.has_content?(@page.content)
end

Then /^I should be redirected to the home page$/ do
  visit '/'
end

Then /^I should see a non\-existent page message$/ do
  page.has_content?("The page you were looking for could not be found!")
end
