### UTILITY METHODS ###

def build_page
  @page = FactoryGirl.create(:page)
end

### GIVEN ###

Given /^I am on the pages page$/ do
  visit '/pages'
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
