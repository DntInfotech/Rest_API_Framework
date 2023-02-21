#Author: akhil.pinnamaraju@poferries.com
#Summary :This feature verifies weather the fields in the profile section
#are accepting the right field values
#Usecases:PROFILE
#Date:27/02/2019


@Regression
Feature: Verify Profile Page field validations

 Background: 
    Given I navigate to the P&O Ferries Freight Website  
    And I click the Book Now Link    
 
    Scenario Outline: Verify error messages when invalid data is entered
    
    And I enter the "<UserName>" in the username edit Box
    And I enter the "<Password>" in the password edit Box
    And I click the LogIn button
    And I verify navigation to the Home Page
    When I click the profile link and verify navigation to the profile page
    And I enter the "<firstName>" in the first name field
    And I enter the "<lastName>" in the last name field
    And I enter the "<mobileNumber>" in the mobile number field
    And I enter the "<companyTitle>" in the company title field
    And I enter the "<companyName>" in the company name field
    And I enter the "<postCode>" in the post code field
    And I enter the "<city>" in the city field
    And I enter the "<addressLine1>" in the addressLine One Field
    And I enter the "<addressLine2>" in the addressLine two Field
    And I click the save profile button
    And I verify the first name "<firstNameError>" error message
    And I verify the last name "<lastNameError>" error message
    And I verify the mobileNumber "<mobileNumberError>" error message
    And I verify the company title "<companyTitleError>" error message
    And I verify the company name "<companyNameError>" error message
    And I verify the postCode "<postCodeError>" error message
    And I verify the city "<cityError>" error message
    And I verify the address Line One "<AddressLine1Error>" error message
    And I verify the address Line two "<AddressLine2Error>" error message
    And I click the LogOut Link
    
     
     Examples:
      
      | UserName                        | Password     |firstName    |lastName   |mobileNumber    |companyTitle|companyName   |postCode|city      |addressLine1|addressLine2|firstNameError           |lastNameError           |mobileNumberError                                                                             |companyTitleError               |companyNameError  |postCodeError                                                  |cityError                       |AddressLine1Error                                         |AddressLine2Error                                         |
      | akhilpinnamaraju004@yahoo.com   | Shogun5050   |NA           |NA         |NA              |NA          | NA           |NA      | NA       |  NA        |NA          | First name is required. |Last Name is required.  |This field is required.                                                                       | NA                             | NA               |Postcode is required.                                          |Town is required.               |Address Line One is required.                             |Address Line Two is required.                             | 
      | akhilpinnamaraju004@yahoo.com   | Shogun5050   |£$@@         |@£$$£      |+44 7968837678  |£$!£        | £!££!£!!£    |@££$%   | @££$     |121212212   |213131313   | Enter a valid name      |Enter a valid name.     |Invalid telephone number! Please use numbers only. For example, +44 should be entered as 0044.|Letters and numbers only please.|NA                |Please remove special characters, use letters and numbers only.|Letters and numbers only please.|Please include the full street name as well as the number.|Please include the full street name as well as the number.| 
      | akhilpinnamaraju004@yahoo.com   | Shogun5050   |213323223    |2113213    |(0)44 7969958462|£$!£        | £!££!£!!£    |@££$%   | @££$     |@££$%       |^&*()       | Enter a valid name      |Enter a valid name.     |Invalid telephone number! Please use numbers only. For example, +44 should be entered as 0044.|Letters and numbers only please.|NA                |Please remove special characters, use letters and numbers only.|Letters and numbers only please.|Please include the full street name as well as the number.|Please include the full street name as well as the number.|                        
      
      
   Scenario Outline: Verify wheather profile changes have been updated
    
    And I enter the "<UserName>" in the username edit Box
    And I enter the "<Password>" in the password edit Box
    And I click the LogIn button
    And I verify navigation to the Home Page
    When I click the profile link and verify navigation to the profile page
    And I enter the "<firstName>" in the first name field
    And I enter the "<lastName>" in the last name field
    And I enter the "<mobileNumber>" in the mobile number field
    And I enter the "<companyTitle>" in the company title field
    And I enter the "<companyName>" in the company name field
    And I enter an invalid "<postCode>" in the post code field
    And I enter the "<city>" in the city field
    And I enter the "<addressLine1>" in the addressLine One Field
    And I enter the "<addressLine2>" in the addressLine two Field
    And I click the save profile button
    Then I verify that the profile has been saved
    And I verify the saved first name "<firstName>"
    And I verify the saved last name "<lastName>"
    And I verify the saved phone number "<mobileNumber>"
    And I verify the saved company title "<companyTitle>"
    And I verify the saved company name "<companyName>"
    And I verify the saved post code "<postCode>"
    And I verify the saved city "<city>"
    And I verify the saved addressLineOne "<addressLine1>"
    And I verify the saved addressLineTwo "<addressLine2>"
    And I click the LogOut Link
        
    
    Examples:
      
      | UserName                        | Password     |firstName    |lastName   |mobileNumber    |companyTitle|companyName   |postCode  |city                   |addressLine1   |addressLine2    |
      | akhilpinnamaraju004@yahoo.com   | Shogun5050   |Akhil        |Raju       |07678847271     |Mr          | POFerries    |MK105BS   | Milton Keynes         |  5 Road       | Close          |  


       
      
  
  