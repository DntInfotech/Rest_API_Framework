package com.web.reporting;

import java.util.concurrent.ConcurrentHashMap;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.ITestContext;
import org.testng.ITestListener;
import org.testng.ITestResult;

import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.markuputils.ExtentColor;
import com.aventstack.extentreports.markuputils.MarkupHelper;

public class TestListner implements ITestListener {
	private static final Logger logger = LogManager.getLogger(TestListner.class);
	private ConcurrentHashMap<String, ExtentTest> allTests = new ConcurrentHashMap<>();
    String reportFolderPath = System.getProperty("user.dir") + "//test-output//AutomationReports//";
    String reportName = "AutomationReport.html";

    //After ending all tests, below method runs.
    @Override
    public void onFinish(ITestContext iTestContext) {
        ExtentManager.getInstance().flush();
    }

    @Override
    public void onTestStart(ITestResult iTestResult) {
        ExtentTest extentTest = ExtentManager.createInstance(reportFolderPath, reportName).createTest(iTestResult.getMethod().getRealClass().getSimpleName());
        allTests.put(iTestResult.getClass().getName(), extentTest);
        ExtentManager.setTest(extentTest);
        ExtentManager.getInstance().flush();
    }

    @Override
    public void onTestSuccess(ITestResult iTestResult) {
        ExtentManager.getTest().get().assignCategory(iTestResult.getClass().getName());
        ExtentManager.getTest().get().createNode(MarkupHelper.createLabel("Test passed", ExtentColor.GREEN).getMarkup());
        ExtentManager.getInstance().flush();
    }

    @Override
    public void onTestFailure(ITestResult iTestResult) {
        try {
            ExtentManager.getTest().get().createNode(MarkupHelper.createLabel("Test Failed", ExtentColor.RED).getMarkup())
                    .fail(iTestResult.getThrowable());
            ExtentManager.getInstance().flush();
            logger.error(iTestResult.getTestClass().getName());
            logger.error(iTestResult.getThrowable());
        } catch (Exception e) {
        	logger.error(e.toString());
        }
    }

    @Override
    public void onTestSkipped(ITestResult iTestResult) {

    }

    @Override
    public void onTestFailedButWithinSuccessPercentage(ITestResult iTestResult) {
    }

    @Override
    public void onStart(ITestContext iTestContext) {

    }
}