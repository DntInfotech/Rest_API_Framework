#Author: shaurya.taneja@poferries.com
#Summary :This file contains the scenarios for testing BookingManagement
#Usecase(Booking management flow)
#Date:05/08/2021


@Regression
Feature: Cash Booking management flow
  As User I should be able to manage booking

  Background: 
    Given I navigate to the P&O Ferries Freight Website  
    And I click the Book Now Link
    And I successfully login credit user

  Scenario Outline: Create, Track and Cancel Booking
    When I click Create Bookings
    And I click Account dropdown
    And I select POF Account
    And I click Route dropdown
    And I select Dover Calais Route
    And I click Unit Type dropdown
    And I select Container Unit Type
    And I input "<JobDescription>" in Job Description
    And I input "<UnitID>" in Unit ID
    And I input "<JobReference>" in Job Reference
    And I input "<UnitLength>" in Unit Length
    And I click Dangerous Goods checkbox
    And I click I Agree checkbox
    And I click Submit Booking button
    And I verify Booking creation with "<JobReference>" Job Reference
    And I click Track Bookings
    And I click Booking with "<JobReference>" Job Reference
    And I verify Booking tracking with "<JobReference>" Job Reference
    And I click Close button
    And I click Manage Bookings
    And I click Cancel button with "<JobReference>" Job Reference
    And I prompt Yes
    And I verify Booking cancellation with "<JobReference>" Job Reference

    Examples: 
      | JobDescription      | UnitID    | JobReference      | UnitLength    |
      | JobDescription1234  | 1234      | JobReference1234  | 20            |

  Scenario Outline: Block and Amend Booking
    When I click Block Bookings
    And I input "<JobDescription>" in first Job Description
    And I input "<UnitID>" in first Unit ID
    And I input "<JobReference>" in first Job Reference
    And I click first Dangerous Goods checkbox
    And I click first I Agree checkbox
    And I click first Submit button
    And I verify first Booking updation
    And I click Manage Bookings
    And I click Filter button
    And I click Account dropdown
    And I select POF Account
    And I click Route dropdown
    And I select Zeebrugge Tilbury Route
    And I click Start Date picker
    And I click 26th Date
    And I input "<JobReference>" in Job Reference filter
    And I click Apply button
    And I click Filter Close button
    And I verify Block Booking updation with "<JobReference>" Job Reference
    And I click Edit button with "<JobReference>" Job Reference
    And I input "<NewJobReference>" in first Job Reference
    And I click first Dangerous Goods checkbox
    And I click first I Agree checkbox
    And I click first Submit button
    And I verify first Booking updation
    And I click Manage Bookings
    And I click Filter button
    And I click Account dropdown
    And I select POF Account
    And I click Route dropdown
    And I select Zeebrugge Tilbury Route
    And I click Start Date picker
    And I click 26th Date
    And I input "<NewJobReference>" in Job Reference filter
    And I click Apply button
    And I click Filter Close button
    And I verify Block Booking updation with "<NewJobReference>" Job Reference
    And I click Cancel button with "<NewJobReference>" Job Reference
    And I prompt Yes
    And I click Filter button
    And I click Account dropdown
    And I select POF Account
    And I click Route dropdown
    And I select Zeebrugge Tilbury Route
    And I click Start Date picker
    And I click 26th Date
    And I input "<NewJobReference>" in Job Reference filter
    And I click Apply button
    And I click Filter Close button
    And I verify Booking cancellation with "<NewJobReference>" Job Reference

    Examples: 
      | JobDescription      | UnitID    | JobReference      | NewJobReference   |     
      | JobDescription2345  | 2345      | JobReference2345  | JobReference2346  |