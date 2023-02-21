package com.Rest_Api.web.utilities;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

//The below class reads the config properties,validation messages from properties files
public class ConfigReader {

	public static final String CONFIG_WEB = "src/test/resources/config/web/config.properties";
	public static final String MESSAGE_WEB = "src/test/resources/config/web/pages.properties";
	public static final String CONFIG_MOBILE = "src/test/resources/config/mobile/config.properties";
	public static final String MESSAGE_MOBILE = "src/test/resources/config/mobile/pages.properties";

	public Properties configWeb = null;
	public Properties pagesWeb = null;
	public Properties configMobile = null;
	public Properties pagesMobile = null;
	
	private Properties properties;
	private static ConfigReader configFileReader;
    private static final String propertyFilePath = "src/test/resources/config/web/config.properties";

    public ConfigReader(){
        BufferedReader reader;

        try {
            reader = new BufferedReader(new FileReader(propertyFilePath));
            properties = new Properties();
            try {
                properties.load(reader);
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Config.properties not found at " + propertyFilePath);
        }
        
		configWeb = new Properties();
		pagesWeb = new Properties();
		configMobile = new Properties();
		pagesMobile = new Properties();

		try {
			FileInputStream fs = new FileInputStream(CONFIG_WEB);
			configWeb.load(fs);

			FileInputStream fso = new FileInputStream(MESSAGE_WEB);
			pagesWeb.load(fso);

			FileInputStream fsm = new FileInputStream(CONFIG_MOBILE);
			configMobile.load(fsm);

			FileInputStream fim = new FileInputStream(MESSAGE_MOBILE);
			configMobile.load(fim);
			

		} catch (Exception e) {
			e.getMessage();
		}
    }

    public static ConfigReader getInstance(){
        return (configFileReader == null) ? new ConfigReader() : configFileReader;
    }

    public String getReportConfigPath(){
        String reportConfigPath = properties.getProperty("reportConfigPath");
        if(reportConfigPath!= null) return reportConfigPath;
        else throw new RuntimeException("Report Config Path not specified in the config.properties file for the Key:reportConfigPath");
    }

}
