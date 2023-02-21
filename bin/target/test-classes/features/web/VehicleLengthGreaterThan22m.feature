#Author: akhil.pinnamaraju@poferries.com
#Summary :This file contains the test where a vehicle length greater than 22m is entered.
#Date:31/10/2019




@Regression
Feature: Vehicle length greater than TwentyTwo metre.

  Background: 
    Given I navigate to the PO Ferries Freight Website
    And I click the Book Now Link
    And I successfully login

  Scenario Outline: Make a booking for a prelodgement
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
    Then I verify the large vehicle length "<message>" based on "<journeyType>"
    And I verify the  large vehicle length depart "<port>" and "<contactTiming>" based on "<journeyType>"
    And I verify the  large vehicle length return "<returnPort>" and "<returnContactTiming>" based on "<journeyType>"
    And I verify the large vehicle length contact "<telephoneNo>" and "<emailAddress>" based on "<journeyType>" 
    And I verify the large vehicle length return contact "<returnTelephoneNo>" and "<returnEmailAddress>" based on "<journeyType>" 
    And I click the Vehicle Length Back Link
    And I verify navigation to the Vehicle Reg Form
    And I click the LogOut Link

    Examples: 
      | currencyUnit |lengthUnit |language|originCountry    |route            | passengers | journeyType | dangerousGoods| pets | registrationNo | length    |message                                                     | port    |returnPort|contactTiming |returnContactTiming| telephoneNo        |returnTelephoneNo|emailAddress                    |returnEmailAddress|
      |    GBP       |Metre      |en      |United Kingdom   |Dover to Calais  |     2      | OneWay      |     NO        |  NO  | AKHILAUTO1     |  23       | Please contact Dover operations team for larger vehicles.  | Dover   |  NA      | 24/7         |  NA               | +44 (0)1304 862539 |      NA         |freightops.dover@poferries.com  |    NA            |
      |    GBP       |Metre      |en      |United Kingdom   |Calais to Dover  |     2      | OneWay      |     NO        |  NO  | AKHILAUTO2     |  22.01    | Please contact Dover operations team for larger vehicles.  | Calais  |  NA      | 24/7         |  NA               | +33 (0)321 461020  |      NA         |freightops.calais@poferries.com |    NA            |
      |    GBP       |Feet       |en      |United Kingdom   |Dover to Calais  |     2      | OneWay      |     NO        |  NO  | AKHILAUTO1     |  72.19    | Please contact Dover operations team for larger vehicles.  | Dover   |  NA      | 24/7         |  NA               | +44 (0)1304 862539 |      NA         |freightops.dover@poferries.com  |    NA            |
      |    GBP       |Feet       |en      |United Kingdom   |Calais to Dover  |     2      | OneWay      |     NO        |  NO  | AKHILAUTO2     |  72.20    | Please contact Dover operations team for larger vehicles.  | Calais  |  NA      | 24/7         |  NA               | +33 (0)321 461020  |      NA         |freightops.calais@poferries.com |    NA            |
     
      
      
     
      
      
      
      
      
      
      