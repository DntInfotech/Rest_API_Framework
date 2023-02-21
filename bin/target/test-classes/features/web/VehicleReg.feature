#Author: akhil.pinnamaraju@poferries.com
#Summary :This feature verifies the 
#Usecases:VEHICLE REGISTRATION FIELD
#Date:03/03/2020



@Regression
Feature: Vehicle Registration Field

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
    Then I verify the displayed vehicle reg "<message>"
    And I click the LogOut Link
    
    
    
        Examples: 
      | currencyUnit | lengthUnit | language | originCountry  | route           | passengers  |journeyType| dangerousGoods | pets | registrationNo | length | message                         |
      | GBP          | Metre      | en       | United Kingdom | Dover to Calais |     2       |OneWay     | NO             | NO   | AKHIL ENG      |     10 | Letters and numbers only please |
      | GBP          | Metre      | en       | United Kingdom | Dover to Calais |     2       |OneWay     | NO             | NO   | £*^%$          |     10 | Letters and numbers only please |
