#Author: akhil.pinnamaraju@poferries.com
#Summary :This file contains the scenario where invalid card details are entered
#Date:31/10/2019


@Regression
Feature: Invalid Card Details and Cancel Payment

  Background: 
    Given I navigate to the PO Ferries Freight Website
    And I click the Book Now Link
    And I successfully login
   
  Scenario Outline: Make a booking for a prelodgement with invalid card Details and cancelling the payment
  
    And I set the "<language>" and "<lengthUnit>" units 
    And I click the Book Link
    And I verify navigation to the Book Now Page  
    When I select the "<route>"
    And I select the journey type as "<journeyType>"
    And I select the currency "<currencyUnit>" and the country of origin "<originCountry>"
    And I select the number of passengers "<passengers>"
    And I make selections for "<dangerousGoods>" and "<pets>"
    And I click continue on the Select Route Form
    And I verify navigation to the Vehicle Reg Form
    And I enter the Vehicle Reg "<registrationNo>" and "<length>"
    And I slect the vehicle "<height>"
    And I make selections for vehicle "<width>" and "<weight>"
    And I click continue on the Vehicle Registration Form
    And I verify navigation to the Review Booking Details Form
    And I click the "<termsConditions>" checkbox
    And I make a selection for "<billingAddress>"
    And I click the Proceed To Payment button
    And I verify navigation to the Payment Page
    And I enter the "<cardNumber>","<cardExpiryDate>" and the "<securityCode>"
    And I click the PayNow button
    Then I verify the Invalid card "<message>" displayed 
    And I click Cancel on the payment Page
    And I close the survey popup
    And I verify navigation to the Payment Failure Screen
    And I verify the payment "<failureMessage>"
    And I click the Go To Home button on the Payment Failure Screen
    And I verify navigation to the Home Page
    And I click the LogOut Link
    
      
    Examples: 
      | currencyUnit |lengthUnit |language|originCountry    |route            | passengers |journeyType | dangerousGoods | pets | registrationNo | length | height             | width | weight |termsConditions | billingAddress | billingName        | cardNumber         | cardExpiryDate | securityCode | message                |failureMessage                                                                                                                   |
      |    GBP       |Metre      |en      | United Kingdom  |Dover to Calais  |     2      |  OneWay    |      NO        |  NO  | AKHILWEB02     |  10    |   NA               |  YES  |  YES   |     YES        |     YES        | Akhil Pinnamaraju  |4111 2111 1111 1111 |  08/20         |    345       | Invalid card number    |Unfortunately your payment has been unsuccessful, please call us on +44 (0)1304 863875 or email on freightsupport@poferries.com  |
      |    GBP       |Metre      |en      | United Kingdom  |Calais to Dover  |     1      |  OneWay    |      NO        |  NO  | AKHILWEB01     |  12    |   NA               |  YES  |  YES   |     YES        |     YES        | Akhil Pinnamaraju  |4111 3111 2111 5111 |  08/20         |    345       | Invalid card number    |Unfortunately your payment has been unsuccessful, please call us on +44 (0)1304 863875 or email on freightsupport@poferries.com  |
      
     
    
    
   