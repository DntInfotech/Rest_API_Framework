#Author: akhil.pinnamaraju@poferries.com
#Summary :This file contains the scenarios for testing JIRA FW-11
#Usecase(Signing in to Web With correct Account Details)
#Date:08/07/2019


@Regression
Feature: Signing in to Web with correct account details
  As User I should be able to sign in once I provide the correct account details.

  Background: 
    Given I navigate to the P&O Ferries Freight Website  
    And I click the Book Now Link

  Scenario Outline: LogIn and Logout with Valid Credentials
    When I enter the "<UserName>" in the username edit Box
    And I enter the "<Password>" in the password edit Box
    And I click the LogIn button
    Then I verify navigation to the Home Page
    And I click the LogOut Link
    And I verify navigation to the Landing Page
   

    Examples: 
      | UserName              | Password   |
      | akhilraju@hotmail.com | Shogun6666 |

  Scenario Outline: LogIn with InValid Credentials
    When I enter the "<UserName>" in the username edit Box
    And I enter the "<InvalidPassword>" in the password edit Box
    And I click the LogIn button
    Then I should be presented with an Invalid credentials "<ErrorMessage>" error

    Examples: 
      | UserName              | InvalidPassword | ErrorMessage                                |
      | akhilraju@hotmail.com | Shogun998       |Invalid login credentials. Please try again. |
      

    
    
    
    
   
     