#Author: akhil.pinnamaraju@poferries.com
#Summary :This file contains the scenarios related to the selection of dangerous goods and pets
#during the booking process,
#Date:28/10/2019


@Regression
Feature: Dangerous goods and Pets selection

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
    Then I verify the dangerousGoods or pets "<message>" displayed
    And I verify the departure "<port>" and "<contactTiming>" based on "<dangerousGoods>" and "<pets>" selection
    And I verify the contact centre "<telephoneNo>" and "<emailAddress>" based on "<dangerousGoods>" and "<pets>" selection
    And I click the dangerousGoods or pets Back Link
    And I verify navigation to the Book Now Page
    And I click the LogOut Link
    
    
   Examples: 
   
      |currencyUnit|lengthUnit|language |originCountry  |route            | passengers |journeyType| dangerousGoods | pets  | message                                                     | port    | contactTiming | telephoneNo        |emailAddress                     |
      |GBP         |Metre     | en      |United Kingdom |Dover to Calais  |     1      |   OneWay  |      YES       |  NO   | As you are carrying dangerous goods                         | Dover   | 24/7          | +44 (0)1304 862539 |freightops.dover@poferries.com   |
      |GBP         |Metre     | en      |United Kingdom |Calais to Dover  |     1      |   OneWay  |      NO        |  YES  | Please call or email us to make a booking with pets/animals | Calais  | 24/7          | +33 (0)321 461020  |freightops.calais@poferries.com  |
      |GBP         |Metre     | en      |United Kingdom |Dover to Calais  |     1      |   OneWay  |      NO        |  YES  | Please call or email us to make a booking with pets/animals | Dover   | 24/7          | +44 (0)1304 862539 |freightops.dover@poferries.com   |
      |GBP         |Metre     | en      |United Kingdom |Dover to Calais  |     1      |   OneWay  |      YES       |  YES  | Please call or email us to make a booking with pets/animals | Dover   | 24/7          | +44 (0)1304 862539 |freightops.dover@poferries.com   |  
      |GBP         |Metre     | en      |United Kingdom |Calais to Dover  |     2      |   OneWay  |      YES       |  NO   | As you are carrying dangerous goods                         | Calais  | 24/7          | +33 (0)321 461020  |freightops.calais@poferries.com  |
      |GBP         |Metre     | en      |United Kingdom |Calais to Dover  |     2      |   OneWay  |      YES       |  YES  | Please call or email us to make a booking with pets/animals | Calais  | 24/7          | +33 (0)321 461020  |freightops.calais@poferries.com  |     
