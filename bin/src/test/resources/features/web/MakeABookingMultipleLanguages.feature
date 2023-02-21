#Author: akhil.pinnamaraju@poferries.com
#Summary :This file contains the scenarios related to making a booking(JIRA FW-15,FW-20,
#FW-23,FW-24,FW-19,FW-22,FW-33 and FW33).
#Usecases:(Route and currency selection,height selection,length of vehicle selection,
#proceed to payment,vehicle registration,no of people selection,Booking confirmation page,
#entering in card information)
#Date:16/07/2019


@Regression
Feature: Validate the Booking process for a prelodgement for multiple languages

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
    And I verify navigation to the Review Booking Details Form
    And I verify the "<departure>" and "<arrival>" ports
    And I verify the vehicle "<registrationNo>","<length>","<height>","<width>" and "<weight>"
    And I verify the number of "<passengers>"
    And I verify the "<netPrice>","<vatAmount>" and "<totalPrice>"
    And I click the "<termsConditions>" checkbox
    And I make a selection for "<billingAddress>"
    And I click the Proceed To Payment button
    And I verify navigation to the Payment Page
    And I verify the "<billingName>" and "<paymentPrice>"
    And I verify the "<addressLine1>","<addressLine2>","<addressTown>","<country>" and "<postcode>"
    And I enter the "<cardNumber>","<cardExpiryDate>" and the "<securityCode>"
    And I click the PayNow button
    And I close the payment success survey popup if required
    Then I verify navigation to the Booking Confirmation Page
    And I verify confirmed "<route>"
    And I verify the confirmed vehicle "<registrationNo>","<length>","<height>","<width>" and "<weight>"
    And I verify the confirmed number of "<passengers>"
    And I verify the confirmed Payment Amounts "<netPrice>","<vatAmount>" and "<totalPrice>"
    And I verify the confirmed Payment Details "<paymentDate>","<paymentType>" and "<paymentStatus>"
    And I capture the waybillNumber
    And I click the LogOut Link

    Examples: 
      | currencyUnit |lengthUnit |language|originCountry    |route            | passengers | journeyType |dangerousGoods| pets | registrationNo | length | height             | width | weight | departure | arrival | netPrice | vatAmount | totalPrice |termsConditions | billingAddress | billingName        |paymentPrice  |addressLine1     | addressLine2  | addressTown     | country | postcode  | cardNumber        | cardExpiryDate | securityCode | paymentDate | paymentType | paymentStatus |
      |    GBP       |Metre      |de      | United Kingdom  |Dover to Calais  |     2      |    OneWay   |    NO        |  NO  | AKHGERMAN      |  7     |Less than 2.5 metre |  YES  |  YES   |  Dover    | Calais  | £ 89.76  |£ 17.95    | £ 107.71   |     YES        |     YES        | Akhil Pinnamaraju  | £107.71      | 10 Nelson Close |  Crownhill    | Milton Keynes   | GB      | MK8 0DL   |4111 1111 1111 1111|  08/20         |    345       | 29-May-2020 |  VISA       | BEZAHLT       |
      |    GBP       |Metre      |fr      | United Kingdom  |Dover to Calais  |     2      |    OneWay   |    NO        |  NO  | AKHFRENCH      |  10    |   NA               |  YES  |  YES   |  Dover    | Calais  | £ 155.66 |£ 31.13    | £ 186.79   |     YES        |     YES        | Akhil Pinnamaraju  | £186.79      | 10 Nelson Close |  Crownhill    | Milton Keynes   | GB      | MK8 0DL   |4111 1111 1111 1111|  08/20         |    345       | 29-May-2020 |  VISA       | PAYÉ          |
      |    Euro      |Feet       |nl      | United Kingdom  |Calais to Dover  |     1      |    OneWay   |    NO        |  NO  | AKHDUTCH       |  46.00 |   NA               |  YES  |  YES   |  Calais   | Dover   | € 207.53 |€ 41.51    | € 249.04   |     YES        |     YES        | Akhil Pinnamaraju  | €249.04      | 10 Nelson Close |  Crownhill    | Milton Keynes   | GB      | MK8 0DL   |4111 1111 1111 1111|  08/20         |    345       | 29-May-2020 |  VISA       | BETAALD       |
      |    GBP       |Metre      |es      | United Kingdom  |Dover to Calais  |     2      |    OneWay   |    NO        |  NO  | AKHSPANNISH    |  7     |Less than 2.5 metre |  YES  |  YES   |  Dover    | Calais  | £ 89.76  |£ 17.95    | £ 107.71   |     YES        |     YES        | Akhil Pinnamaraju  | £107.71      | 10 Nelson Close |  Crownhill    | Milton Keynes   | GB      | MK8 0DL   |4111 1111 1111 1111|  08/20         |    345       | 29-May-2020 |  VISA       | PAGADO        |
      |    GBP       |Metre      |en      | United Kingdom  |Dover to Calais  |     2      |    OneWay   |    NO        |  NO  | AKHILENG       |  10    |   NA               |  YES  |  YES   |  Dover    | Calais  | £ 155.66 |£ 31.13    | £ 186.79   |     YES        |     YES        | Akhil Pinnamaraju  | £186.79      | 10 Nelson Close |  Crownhill    | Milton Keynes   | GB      | MK8 0DL   |4111 1111 1111 1111|  08/20         |    345       | 29-May-2020 |  VISA       | PAID          |
      |    Euro      |Feet       |pl      | United Kingdom  |Calais to Dover  |     1      |    OneWay   |    NO        |  NO  | AKHILPOLISH    |  46.00 |   NA               |  YES  |  YES   |  Calais   | Dover   | € 207.53 |€ 41.51    | € 249.04   |     YES        |     YES        | Akhil Pinnamaraju  | €249.04      | 10 Nelson Close |  Crownhill    | Milton Keynes   | GB      | MK8 0DL   |4111 1111 1111 1111|  08/20         |    345       | 29-May-2020 |  VISA       | PŁATNY        |
      
     
     
   
      