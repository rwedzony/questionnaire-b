require 'test_helper'

class FormTest < ActiveSupport::TestCase
  
  def setup 
    @form = Form.new()
  end

   test "form should not be valid without given first name" do
     assert_not @form.valid?
   end

   test "form should not be valid without given birth date" do
     @form.first_name="Sampledata"
     assert_not @form.valid?
   end

   test "Something_about attribute can be blank" do
     @form.first_name="Sampledata"
     @form.birth_date="18.01.1991"
     assert @form.valid?
   end

   test "Something_about attribute should be top 140 characters long" do
     @form.first_name="Sampledata"
     @form.birth_date="18.01.1991"
     @form.something_about="a"*141
     assert_not @form.valid?
   end

end
