package com.web.hooks;

import java.util.HashMap;
import java.util.Map;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.MediaEntityBuilder;
import com.aventstack.extentreports.Status;
import com.aventstack.extentreports.gherkin.model.Given;
import com.aventstack.extentreports.reporter.ExtentSparkReporter;
import com.aventstack.extentreports.reporter.configuration.Theme;

import io.cucumber.plugin.EventListener;
import io.cucumber.plugin.event.EmbedEvent;
import io.cucumber.plugin.event.EventPublisher;
import io.cucumber.plugin.event.HookTestStep;
import io.cucumber.plugin.event.PickleStepTestStep;
import io.cucumber.plugin.event.TestCaseFinished;
import io.cucumber.plugin.event.TestCaseStarted;
import io.cucumber.plugin.event.TestRunFinished;
import io.cucumber.plugin.event.TestRunStarted;
import io.cucumber.plugin.event.TestSourceRead;
import io.cucumber.plugin.event.TestStepFinished;
import io.cucumber.plugin.event.TestStepStarted;
import io.cucumber.plugin.event.WriteEvent;

public class CustomReportListener implements EventListener {

	private String reportFolderPath = System.getProperty("user.dir") + "//test-output//AutomationReports//";
    private String reportName = "ExecutionReport.html";
    private ExtentSparkReporter spark;
    private ExtentReports extent;

    Map<String, ExtentTest> feature = new HashMap<String, ExtentTest>();
    ExtentTest scenario;
    ExtentTest step;

    public CustomReportListener() {
    };

    @Override
    public void setEventPublisher(EventPublisher publisher) {
        // TODO Auto-generated method stub
        /*
         * :: is method reference , so this::collecTag means collectTags method in
         * 'this' instance. Here we says runStarted method accepts or listens to
         * TestRunStarted event type
         */
        publisher.registerHandlerFor(TestRunStarted.class, this::runStarted);
        publisher.registerHandlerFor(TestRunFinished.class, this::runFinished);
        publisher.registerHandlerFor(TestSourceRead.class, this::featureRead);
        publisher.registerHandlerFor(TestCaseStarted.class, this::ScenarioStarted);
        //publisher.registerHandlerFor(TestCaseFinished.class, this::ScenarioFinished);
        publisher.registerHandlerFor(TestStepStarted.class, this::stepStarted);
        publisher.registerHandlerFor(TestStepFinished.class, this::stepFinished);
        //publisher.registerHandlerFor(EmbedEvent.class, this::stepEmbedded);
        publisher.registerHandlerFor(WriteEvent.class, this::writeEventhandler);
    };

    /*
     * Here we set argument type as TestRunStarted if you set anything else then the
     * corresponding register shows error as it doesn't have a listner method that
     * accepts the type specified in TestRunStarted.class
     */

    // Here we create the reporter
    private void runStarted(TestRunStarted event) {
        spark = new ExtentSparkReporter(reportFolderPath + reportName);
        extent = new ExtentReports();
        spark.config().setTheme(Theme.STANDARD);
        spark.config().setDocumentTitle("Automation Execution Report");
        spark.config().setReportName("Automation Execution Reports ");
        spark.config().setEncoding("utf-8");
        spark.config().setTimelineEnabled(true);
        spark.config().setTimeStampFormat("MMM dd, yyyy HH:mm:ss");
        // Create extent report instance with spark reporter
        extent.attachReporter(spark);
    };

    // TestRunFinished event is triggered when all feature file executions are
    // completed
    private void runFinished(TestRunFinished event) {
        extent.flush();
    };

    // This event is triggered when feature file is read
    // here we create the feature node
    private void featureRead(TestSourceRead event) {
        String featureSource = event.getUri().toString();
        String featureName = featureSource.split(".*/")[1];

        if (feature.get(featureSource) == null) {
            feature.putIfAbsent(featureSource, extent.createTest(featureName));
        }
    };

    // This event is triggered when Test Case is started
    // here we create the scenario node
    private void ScenarioStarted(TestCaseStarted event) {
        String featureName = event.getTestCase().getUri().toString();
        scenario = feature.get(featureName).createNode(event.getTestCase().getName());
    };
    
    @SuppressWarnings("unused")
	private void ScenarioFinished(TestCaseFinished event) {
        String featureName = event.getTestCase().getUri().toString();
        scenario = feature.get(featureName).createNode(event.getTestCase().getName());
        if (event.getResult().getStatus().toString() == "PASSED") {
        	scenario.log(Status.PASS, "This passed");
        } else if (event.getResult().getStatus().toString() == "SKIPPED"){
        	scenario.log(Status.SKIP, "This skipped ");
        } else {
        	scenario.log(Status.FAIL, "This failed");
        }
    };

    // step started event
    // here we creates the test node
    private void stepStarted(TestStepStarted event) {
        String stepName = " ";
        String keyword = "Triggered the hook :";

        // We checks whether the event is from a hook or step
        if (event.getTestStep() instanceof PickleStepTestStep) {
            // TestStepStarted event implements PickleStepTestStep interface
            // WHich have additional methods to interact with the event object
            // So we have to cast TestCase object to get those methods
            PickleStepTestStep steps = (PickleStepTestStep) event.getTestStep();
            stepName = steps.getStep().getText();
            keyword = steps.getStep().getKeyword();

        } else {
            // Same with HooKTestStep
            HookTestStep hoo = (HookTestStep) event.getTestStep();
            stepName = hoo.getHookType().name();
        }

        step = scenario.createNode(Given.class, keyword + " " + stepName);
    };

    // This is triggered when TestStep is finished
    private void stepFinished(TestStepFinished event) {

        if (event.getResult().getStatus().toString() == "PASSED") {
            step.log(Status.PASS,"This Step is passed");
        } else if (event.getResult().getStatus().toString() == "SKIPPED"){
            step.log(Status.SKIP, "This step was skipped ");
        } else {
            step.log(Status.FAIL, "This step is failed");
        }
    };
    
    @SuppressWarnings("unused")
	private void stepEmbedded(EmbedEvent event) {

        byte[] a = event.getData();
        String s = new String(a);
        
       step.log(Status.PASS, "This Step is passed" ,
	        MediaEntityBuilder.createScreenCaptureFromBase64String(s).build());

    };
    
    private void writeEventhandler(WriteEvent write){
        
    }
}
