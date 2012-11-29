### UTILITY METHODS ###
def build_product
  @product = FactoryGirl.build(:product)
end

def create_product
  @product = FactoryGirl.create(:product)
end

def create_non_existent_product
  @product = FactoryGirl.create(:product, :name => "ycnaf")
  @product.destroy
end

### GIVEN ###
Given /^I am on a company page$/ do
  create_company
  visit company_path(@company)
end

Given /^there is a product listed$/ do
  create_product
end

Given /^I am on the product page$/ do
  visit product_path(@product)
end

Given /^I am on the products page$/ do
  visit '/products'
end

Given /^I follow the product$/ do
  %{I am on the product page}
end

### WHEN ###

When /^I add a new product that belongs to a company$/ do
  build_product
  create_company
  visit company_path(@company)
  click_on 'New Product'
  fill_in 'Name', with: @product[:name]
  select @company.name, from: 'Company'
  click_button 'Submit'
end

When /^I follow the edit link for the product$/ do
  visit product_path(@product)
  click_link "Edit Product"
end

When /^I click on the company name$/ do
  click_link @product.company.name
end

When /^I make changes in the product form$/ do
  fill_in "Name", with: @product.name
  click_button "Submit"
end

When /^I follow the delete link for the product$/ do
  create_admin
  sign_in
  visit product_path(@product)
  click_link "Delete Product"
end

### THEN ###

Then /^I should see the page for the newly created product$/ do
  create_product
  visit product_path(@product)
end

Then /^I should see the product name$/ do
  page.has_content?(@product.name)
end

Then /^I should see the company name to which the product belongs to$/ do
  page.has_content?(@product.company.name)
end

Then /^I should not see the edit link for the product$/ do
  page.should_not have_content("Edit Product")
end

Then /^I should see the edit link for the product$/ do
  page.has_content?("Edit Product")
end

Then /^I am on the company page$/ do
  create_product
  visit company_path(@product.company)
end

Then /^I should see the updated page for the product$/ do
  visit product_path(@product)
end

Then /^I should not see the delete link for the product$/ do
  page.should_not have_content("Delete Product")
end

Then /^I should see the delete link for the product$/ do
  page.has_content?("Delete Product")
end

Then /^I should see a successful delete message for the product$/ do
  page.should have_content("Product has been deleted")
end

Then /^I should not see the deleted product$/ do
  page.should_not have_content(@product.name)
end

Then /^I should see the list of products$/ do
  create_product
  Product.all.each do |p|
    page.has_content?(p.name)
  end
end

Then /^I should see a list of products matching that partial word$/ do
  page.has_content?("fan")
end

When /^I search for a non\-existent product$/ do
  create_non_existent_product
  visit '/products'
  fill_in 'query', :with => 'ycnaf'
  click_button 'Search'
end

Then /^I should not see the non\-existent product$/ do
  page.should_not have_content("ycnaf")
end

Then /^I should see an unsuccesful product seach message$/ do
  page.should have_content("The product you were looking for could not be found!")
end

Then /^I should see an unsuccesful product search message$/ do
  page.should have_content("The product you were looking for could not be found")
end
