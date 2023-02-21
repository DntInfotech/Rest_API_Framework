
#Author: akhil.pinnamaraju@poferries.com
#Summary :This feature verifies the change password functionality
#Usecases:CHANGE PASSWORD
#Date:26/02/2019

@Regression
Feature: Change password functionality

 Background: 
    Given I navigate to the P&O Ferries Freight Website  
    And I click the Book Now Link
         
 Scenario Outline: Change password Successfully
    
    And I enter the "<UserName>" in the username edit Box
    And I enter the "<Password>" in the password edit Box
    And I click the LogIn button
    And I verify navigation to the Home Page
    When I click the profile link and verify navigation to the profile page
    And I click the change password link and verify navigation
    And I enter the "<currentPassword>" in the current password field
    And I enter the "<newPassword>" in the new password field
    And I enter the "<confirmPassword>" in the confirm password field
    And I click the Update password button
    Then I verify the password successfully updated "<successMessage>" 
    And I make selection to Login with new password
    And I verify navigation to the Login page
    And I enter the "<UserName>" in the username edit Box
    And I enter the "<newPassword>" in the password edit Box
    And I click the LogIn button
    And I verify navigation to the Home Page
    And I click the profile link and verify navigation to the profile page
    And I click the change password link and verify navigation
    And I enter the "<newPassword>" in the current password field
    And I enter the "<currentPassword>" in the new password field
    And I enter the "<currentPassword>" in the confirm password field
    And I click the Update password button
    And I verify the password successfully updated "<successMessage>" 
    And I make selection to Login with new password
    And I click the LogOut Link
    
    
     Examples:
      
      | UserName                        | Password     |currentPassword      | newPassword   |confirmPassword |successMessage                   |
      | akhilpinnamaraju004@yahoo.com   | Shogun5050   |Shogun5050           | Shogun7070    |Shogun7070      |Password successfully changed    |   
      
      
 Scenario Outline: Click Update password with Blank fields
   
    And I enter the "<UserName>" in the username edit Box
    And I enter the "<Password>" in the password edit Box
    And I click the LogIn button
    And I verify navigation to the Home Page
    When I click the profile link and verify navigation to the profile page
    And I click the change password link and verify navigation
    And I enter the "<currentPassword>" in the current password field
    And I enter the "<newPassword>" in the new password field
    And I enter the "<confirmPassword>" in the confirm password field
    And I click the Update password button
    Then I verify the displayed current password "<currentPasswordMessage>" message
    And I verify the displayed new password "<newPasswordMessage>" message
    And I verify the displayed confirm password "<confirmPasswordMessage>" message
    And I click the LogOut Link
    
       Examples: 
       
      | UserName                        | Password      |currentPassword      | newPassword   |confirmPassword |currentPasswordMessage       |newPasswordMessage       |confirmPasswordMessage                          |
      | akhilpinnamaraju004@yahoo.com   | Shogun5050    |NA                   | NA            |Shogun6060      |NA                           |NA                       |New Password and Confirm Password must be same. |
      | akhilpinnamaraju004@yahoo.com   | Shogun5050    |NA                   | Shogun6060    |NA              |Current Password is required.|NA                       |Confirm Password is required.                   |
      | akhilpinnamaraju004@yahoo.com   | Shogun5050    |NA                   | NA            |NA              |Current Password is required.|New Password is required.|Confirm Password is required.                   |
      | akhilpinnamaraju004@yahoo.com   | Shogun5050    |Shogun5050           | NA            |NA              |NA                           |New Password is required.|Confirm Password is required.                   |

  Scenario Outline: Click Update password with Invalid Details
   
    And I enter the "<UserName>" in the username edit Box
    And I enter the "<Password>" in the password edit Box
    And I click the LogIn button
    And I verify navigation to the Home Page
    When I click the profile link and verify navigation to the profile page
    And I click the change password link and verify navigation
    And I enter the "<currentPassword>" in the current password field
    And I enter the "<newPassword>" in the new password field
    And I enter the "<confirmPassword>" in the confirm password field
    And I click the Update password button
    Then I verify the displayed changePassword "<errorMessage>" message  
    And I click the LogOut Link  

     Examples: 
     
      | UserName                        | Password     |currentPassword      | newPassword   |confirmPassword |errorMessage                                                                                     |
      | akhilpinnamaraju004@yahoo.com   | Shogun5050   |Shogun6060           | Shogun7070    |Shogun7070      |×Your password does not match.                                                                   |
      | akhilpinnamaraju004@yahoo.com   | Shogun5050   |Shogun5050           | Shogun5050    |Shogun5050      |Please enter a different password. Your new password should not be same as your current password.|
      | akhilpinnamaraju004@yahoo.com   | Shogun5050   |Shogun5050           | Shogun7070    |Shogun6060      |New Password and Confirm Password must be same.                                                  |     
  
  
  
 
     
     
      
