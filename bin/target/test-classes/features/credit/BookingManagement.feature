#Author: Ravikant Vyas
#Summary :This file contains the scenarios for testing BookingManagement
#Usecase(Booking management flow)
#Date:22/08/2021


@Regression
Feature: Booking management flow
  As User I should be able to manage booking

  Background: 
    Given I navigate to the P&O Ferries Freight Website  
    And I click the Book Now Link
    And I successfully login credit user

  Scenario Outline: Create, Track and Cancel Booking
  When I click Create Bookings
	And I click Route dropdown
	And I select Dover Calais Route
	# And I select One Way
	# And I click Currency dropdown
	# And I select GBP Currency
	# And I click Country of Originating dropdown
	# And I select United Kingdom Country
	# And I click Number of passengers dropdown
	# And I select 2 Number of passengers
	# And I click transporting dangerous goods ckeckbox
	# And I click transporting any pets checkbox
	# And I click Continue Booking