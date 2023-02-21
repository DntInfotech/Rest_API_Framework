#Author: akhil.pinnamaraju@poferries.com
#Summary :This feature verifies weather the user can update the address
#using the address lookup on the profile page
#Usecases:Change address from the profile Page using address Lookup
#Date:11/03/2020

@Regression
Feature: Verify address has been changed from profile Page

 Background: 
    Given I navigate to the P&O Ferries Freight Website  
    And I click the Book Now Link
         
 Scenario Outline: Verify error messages when invalid data is entered
    
    And I enter the "<UserName>" in the username edit Box
    And I enter the "<Password>" in the password edit Box
    And I click the LogIn button
    And I verify navigation to the Home Page
    When I click the profile link and verify navigation to the profile page
    And I enter the "<postCode>" in the post code field
    And I click the postcode search icon
    And I select the address corresponding to "<address>"
    And I click the continue button
    Then I verify that the address fields are populated with "<postCode>" and "<address>"
    And I click the save profile button
    And I verify that the profile has been saved
    And I click the LogOut Link
    
    
  
   Examples:
      
      | UserName                        | Password     |postCode |address        |
      | akhilpinnamaraju004@yahoo.com   | Shogun5050   |MK8 0DL  |10 Nelson Close|
   
