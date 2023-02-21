#Author: akhil.pinnamaraju@poferries.com
#Summary :This feature verifies weather the amend booking details are displayed as expected
#Usecases:AMEND BOOKING
#entering in card information)
#Date:20/02/2019

@Regression
Feature: Amend Booking

  Background: 
    Given I navigate to the PO Ferries Freight Website
    And I click the Book Now Link
    And I successfully login

  Scenario Outline: Amend Booking
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
    And I close the payment success survey popup if required
    Then I verify navigation to the Booking Confirmation Page
    And I click the Amend Booking Link
    And I verify navigation to the Amend Booking Page
    And I verify the amend Booking "<message>" and the "<secondMessage>"
    And I verify the amend Booking port "<portOffice>" and timing "<openTiming>"
    And I verify the amend Booking telephone "<telephoneNo>" and email "<emailAddress>"
    And I click Back on the Amend Booking Page
    And I verify navigation to the Booking Confirmation Page
    And I click the LogOut Link

    Examples: 
      | currencyUnit | lengthUnit | language | originCountry  | route           | passengers |journeyType| dangerousGoods | pets | registrationNo | length | height | width | weight | departure | arrival | termsConditions | billingAddress | cardNumber          | cardExpiryDate | securityCode | message                                                           | secondMessage                                                   | portOffice        | openTiming | telephoneNo        | emailAddress                   |
      | GBP          | Metre      | en       | United Kingdom | Dover to Calais |          2 |OneWay     | NO             | NO   | AKHILENG       |     10 | NA     | YES   | YES    | Dover     | Calais  | YES             | YES            | 4111 1111 1111 1111 | 08/20          |          345 | If you wish to make a change to this booking please call or email | Please have your booking details to hand and we'll do the rest. | Dover Port Office |      24/7  | +44 (0)1304 862539 | freightops.dover@poferries.com |
