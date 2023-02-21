package com.Rest_Api.web.utilities;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Random;

public class testExcelData {
	
	public static void main(String[] args) {
		
		try {
			/*String filepath = "C:\\Users\\Khairnar_S\\eclipse-workspace\\POFerriesAutomation\\AutomationFramework\\test-output\\TestResult2021_12_11_07_29_33.xls";
			testResultMail testResultMail = new testResultMail();
			testResultMail.sendMailwithAttachments("Shrikant.Khairnar@poferries.com", "Enigma123$", "Shrikant.Khairnar@poferries.com", "TestMail", filepath);*/
			
			/*ConfigReader configReader = new ConfigReader();
			TestDataUtil testdata = new TestDataUtil();
			String TestdataFile = System.getProperty("user.dir") + configReader.configWeb.getProperty("DriverPlugInTestData");
			
			testdata.readTestData(TestdataFile, "CREATEBOOKINGS");
			System.out.println(testdata.testDataRowCount);*/
			
			//System.out.println(generateRandomNumbers(15));
			
			DateTimeFormatter f1 = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			String StrDate = new SimpleDateFormat("dd/MM/yyyy").format(new Date());
			System.out.println(StrDate);
			LocalDate date = LocalDate.parse(StrDate.toString(),f1);
			date = date.plusDays(14);
			System.out.println(date.toString());
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			String formattedString = date.format(formatter);
			System.out.println(formattedString);
	    	/*String StrYear = String.valueOf(date.getYear());
	    	String StrMonth = new DateFormatSymbols().getMonths()[date.getMonthValue()-1];
	    	String StrDay = String.valueOf(date.getDayOfMonth());
	    	
	    	System.out.println(StrYear + StrMonth + StrDay);*/
			
		} catch (Exception e) {
			//e.printStackTrace();
		}
		
		System.out.println("Done");
	}
	
	public static String generateRandomString(int len) {
		String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		Random rnd = new Random();
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++)
			sb.append(chars.charAt(rnd.nextInt(chars.length())));
		return sb.toString();
	}
	
	public static String generateRandomNumbers(int len) {
		String chars = "0123456789";
		Random rnd = new Random();
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++)
			sb.append(chars.charAt(rnd.nextInt(chars.length())));
		return sb.toString();
	}

}
