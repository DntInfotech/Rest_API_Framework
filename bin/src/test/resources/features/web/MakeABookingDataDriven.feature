#Author: akhil.pinnamaraju@poferries.com
#Summary :This file contains the scenarios related to making a booking(JIRA FW-15,FW-20,
#FW-23,FW-24,FW-19,FW-22,FW-33 and FW33).
#Usecases:(Route and currency selection,height selection,length of vehicle selection,
#proceed to payment,vehicle registration,no of people selection,Booking confirmation page,
#entering in card information)
#Date:30/07/2019



@Regression
Feature: Validate the Booking process for a prelodgement

  Background: 
    Given I navigate to the PO Ferries Freight Website
    And I click the Book Now Link
    And I successfully login
   

  Scenario Outline: Make a DataDriven booking for a prelodgement
  
    And I set the "dt_language" and "dt_lengthUnit" units and "<row>"
    And I click the Book Link
    And I verify navigation to the Book Now Page
    When I select the "dt_route"
    And I select the journey type as "dt_journeyType"
    And I select the currency "dt_currencyUnit" and the country of origin "dt_originCountry"
    And I select the number of passengers "dt_passengers"      
    And I make selections for "dt_dangerousGoods" and "dt_pets"
    And I click continue on the Select Route Form
    And I verify navigation to the Vehicle Reg Form
    And I enter the Vehicle Reg "dt_registrationNo" and "dt_length"
    And I slect the vehicle "dt_height"
    And I make selections for vehicle "dt_width" and "dt_weight"
    And I click continue on the Vehicle Registration Form
    And I verify navigation to the Review Booking Details Form
    And I verify the "dt_departure" and "dt_arrival" ports
    And I verify the vehicle "dt_registrationNo","dt_length","dt_height","dt_width" and "dt_weight"
    And I verify the number of "dt_passengers"
    And I verify the onward route "dt_onwardRoute" and the return route "dt_returnRoute"
    And I verify the "dt_netPrice","dt_vatAmount" and "dt_totalPrice"
    And I verify the return  "dt_returnNetPrice" and "dt_returnVatAmount" if required
    And I click the "dt_termsConditions" checkbox
    And I make a selection for "dt_billingAddress"
    And I click the Proceed To Payment button
    And I verify navigation to the Payment Page
    And I verify the "dt_billingName" and "dt_paymentPrice"
    And I verify the "dt_addressLine1","dt_addressLine2","dt_addressTown","dt_country" and "dt_postcode"
    And I enter the "dt_cardNumber","dt_cardExpiryDate" and the "dt_securityCode"
    And I click the PayNow button
    And I close the payment success survey popup if required   
    Then I verify navigation to the Booking Confirmation Page  
    And I verify confirmed "dt_route"
    And I verify the confirmed vehicle "dt_registrationNo","dt_length","dt_height","dt_width" and "dt_weight"
    And I verify the confirmed number of "dt_passengers"
    And I verify the confirmed onward route "dt_onwardRoute" and the confirmed return route "dt_returnRoute" if required
    And I verify the confirmed Payment Amounts "dt_netPrice","dt_vatAmount" and "dt_totalPrice"
    And I verify the confirmed return  "dt_returnNetPrice" and "dt_returnVatAmount" if required
    And I verify the confirmed Payment Details "dt_paymentDate","dt_paymentType" and "dt_paymentStatus"
    And I caputure the waybillNumber
    And I Logout of Application

     Examples: 
      |row    |
      | 1     |
      | 2     |
      
     
      
    


        
      
     
     
  
  