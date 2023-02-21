#Author: akhil.pinnamaraju@poferries.com
#Summary :This file contains the scenarios related to the selection of abnormal vehicle width and weight
#during the booking process,
#Date:30/10/2019


@Regression
Feature: Abnormal weight width selection.

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
    And I slect the vehicle "<height>"
    And I make selections for vehicle "<width>" and "<weight>"
    And I click continue on the Vehicle Registration Form    
    Then I verify the abnormal width or weight "<message>" displayed based on "<width>" and "<weight>" selections
    And I verify the depart "<port>" and "<contactTiming>" displayed based on "<width>" and "<weight>" selections
    And I verify the contact "<telephoneNo>" and "<emailAddress>" displayed based on "<width>" and "<weight>" selections
    And I click the abnormal width or weight Back Link
    And I verify navigation to the Vehicle Reg Form
    And I click the LogOut Link
    
  Examples: 
      | currencyUnit |lengthUnit |language|originCountry    |route            |journeyType | passengers | dangerousGoods | pets | registrationNo | length | height   | width | weight |message                                                   | port    |contactTiming | telephoneNo        |emailAddress                    |
      |    GBP       |Metre      |en      |United Kingdom   |Dover to Calais  | OneWay     |     2      |      NO        |  NO  | AKHILAUTO1     |  10    |   NA     |  NO   |  YES   | Abnormal vehicle width                                   | Dover   | 24/7         | +44 (0)1304 862539 |freightops.dover@poferries.com  |
      |    GBP       |Metre      |en      |United Kingdom   |Dover to Calais  | OneWay     |     2      |      NO        |  NO  | AKHILAUTO2     |  10    |   NA     |  YES  |  NO    | Please call or email us to book your +44 tonnes vehicle. | Dover   | 24/7         | +44 (0)1304 862539 |freightops.dover@poferries.com  |
      |    GBP       |Metre      |en      |United Kingdom   |Dover to Calais  | OneWay     |     2      |      NO        |  NO  | AKHILAUTO3     |  10    |   NA     |  NO   |  NO    | Please call or email us to book your +44 tonnes vehicle. | Dover   | 24/7         | +44 (0)1304 862539 |freightops.dover@poferries.com  |
      |    GBP       |Metre      |en      |United Kingdom   |Calais to Dover  | OneWay     |     2      |      NO        |  NO  | AKHILAUTO4     |  10    |   NA     |  NO   |  YES   | Abnormal vehicle width                                   | Calais  | 24/7         | +33 (0)321 461020  |freightops.calais@poferries.com |
      |    GBP       |Metre      |en      |United Kingdom   |Calais to Dover  | OneWay     |     2      |      NO        |  NO  | AKHILAUTO5     |  10    |   NA     |  YES  |  NO    | Please call or email us to book your +44 tonnes vehicle. | Calais  | 24/7         | +33 (0)321 461020  |freightops.calais@poferries.com |
      |    GBP       |Metre      |en      |United Kingdom   |Calais to Dover  | OneWay     |     2      |      NO        |  NO  | AKHILAUTO6     |  10    |   NA     |  NO   |  NO    | Please call or email us to book your +44 tonnes vehicle. | Calais  | 24/7         | +33 (0)321 461020  |freightops.calais@poferries.com |
      

      
      
      
     
