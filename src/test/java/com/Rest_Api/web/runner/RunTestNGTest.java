package com.Rest_Api.web.runner;


import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Listeners;
import org.testng.annotations.Test;

import com.testresult.email.MailSetup;
import com.web.reporting.TestListner;

import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.FeatureWrapper;
import io.cucumber.testng.PickleWrapper;
import io.cucumber.testng.TestNGCucumberRunner;
import main.AppTest;

@CucumberOptions(features = { "src/test/java/features" }, glue = { "com.Rest_Api.web.stepDefinitions",
		"com.web.hooks" }, plugin = { "com.web.hooks.CustomReportListener",
				"io.qameta.allure.cucumber7jvm.AllureCucumber7Jvm",
				"com.aventstack.extentreports.cucumber.adapter.ExtentCucumberAdapter:" })

@Listeners({ TestListner.class })
public class RunTestNGTest {

	private TestNGCucumberRunner testNGCucumberRunner;

	@BeforeClass(alwaysRun = true)
	public void setUpClass() {
		testNGCucumberRunner = new TestNGCucumberRunner(this.getClass());
	}

	@Test(groups = "cucumber", description = "Runs Cucumber Scenarios", dataProvider = "features")
	public void feature(PickleWrapper pickleEvent, FeatureWrapper cucumberFeature) throws Throwable {
		testNGCucumberRunner.runScenario(pickleEvent.getPickle());

	}

	@DataProvider(name = "features")
	public Object[][] scenarios() {
		return testNGCucumberRunner.provideScenarios();
	}

	@AfterClass(alwaysRun = true)
	public void tearDownClass() throws Throwable {
		
		try {testNGCucumberRunner.finish();} 
		catch (Exception e) {}
		AppTest appTest = new AppTest(null);
		appTest.testCreateReport();
		MailSetup mailSetup = new MailSetup();
		mailSetup.sendTestResultMailwithAttachments();
	}

}
