require 'test_helper'

class FormTest < ActiveSupport::TestCase
  
  def setup 
    @form = Form.new(first_name: "SampleName",birth_date: "18.05.1990", 
                    os: "Windows", something_about:"sampledescription")
  end

   #First_name attribute test cases
   test "form's first_name must not be nil" do
     @form.first_name=nil
     assert_not @form.valid?
   end

   test "form's first_name must not be empty" do
     @form.first_name =""
     assert_not @form.valid?
   end

   test "form's first_name must not be blank" do
     @form.first_name =" "
     assert_not @form.valid?
   end

   test "form's first_name must contain at least 1 character" do
     @form.first_name ="a"
     assert @form.valid?
   end

   test "form's first_name must contain 50 characters max" do
     @form.first_name ="a"*50
     assert @form.valid?
   end

   test "form's first_name must not contain more than 51 characters" do
     @form.first_name ="a"*51
     assert_not @form.valid?
   end


  #birth_date attribute test cases
   test "form's birth_date must not be nil" do
     @form.birth_date=nil
     assert_not @form.valid?
   end

   test "form's birth_date must not be blank" do
     @form.birth_date=""
     assert_not @form.valid?
   end

   test "form's birth_date must not be empty" do
     @form.birth_date=" "
     assert_not @form.valid?
   end

   test "form's birth_day must contain at least 1 character" do
     @form.birth_date ="a"
     assert @form.valid?
   end

   test "form's birth_day must contain 10 characters max" do
     @form.birth_date ="a"*10
     assert @form.valid?
   end

   test "form's birth_day must not contain more than 11 characters" do
     @form.birth_date ="a"*11
     assert_not @form.valid?
   end


  #something_about attribute test cases
   test "form's Something_about attribute should be top 140 characters long" do
     @form.something_about="a"*140
     assert @form.valid?
   end

   test "form's Something_about attribute must not be longer than 140 characters long" do
     @form.something_about="a"*141
     assert_not @form.valid?
   end

   #os attribute test cases
   test "form's os attribute can by blank" do
     @form.os=nil
     assert @form.valid?
   end

   test "form's os attribute can by empty" do
     @form.os=""
     assert @form.valid?
   end

    test "form's os attribute should be valid for 'Windows' value" do
     @form.os="Windows"
     assert @form.valid?
    end

    test "form's os attribute should be valid for 'Linux' value" do
     @form.os="Linux"
     assert @form.valid?
    end

    test "form's os attribute should be valid for 'MacOS' value" do
     @form.os="MacOS"
     assert @form.valid?
    end

    test "form's os attribute raises argument error for any other value" do
     assert_raises(ArgumentError) {@form.os="sdfdsfsdfsdf"}
    end


end
