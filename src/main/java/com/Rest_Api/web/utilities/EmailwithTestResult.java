package com.Rest_Api.web.utilities;

public class EmailwithTestResult {
	/*@Keyword
	def sendemail(String [] args) {
		String to = "shrikant.khairnar7@gmail.com";
		String subject = "[Project Name] [API Result]"+ GlobalVariable.ExecDateTime
		final String from ="shrikant.iqr@gmail.com"
		final  String password =""

		String body = testingHTML();
		Properties props = new Properties();

		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.debug", "true");
		props.setProperty("mail.transport.protocol", "smtp");
		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(from,password);
					}
				});
		try {
			// Create a default MimeMessage object.
			//session.setDebug(true);
			Transport transport = session.getTransport();
			InternetAddress addressFrom = new InternetAddress(from);
			MimeMessage message = new MimeMessage(session);
			message.setFrom(addressFrom);
			message.setSubject(subject);

			// Create the message part
			BodyPart messageBodyPart = new MimeBodyPart();

			// Now set the actual message
			messageBodyPart.setContent(body, "text/html;charset=UTF-8");

			// Create a multipar message
			Multipart multipart = new MimeMultipart();

			// Set text message part
			multipart.addBodyPart(messageBodyPart);

			// Part two is attachment
			messageBodyPart = new MimeBodyPart();
			String fileAttachment = GlobalVariable.TestResultFile;


			println (fileAttachment)
			DataSource source = new FileDataSource(fileAttachment);
			String filename = new File(fileAttachment).getName();
			println filename
			messageBodyPart.setDataHandler(new DataHandler(source));
			messageBodyPart.setFileName(filename);
			multipart.addBodyPart(messageBodyPart);

			message.setContent(multipart);

			InternetAddress[] iAdressArray = InternetAddress.parse(to);
			message.setRecipients(Message.RecipientType.TO, iAdressArray);
			transport.connect();
			Transport.send(message);
			transport.close();
			System.out.println("Sent message successfully....");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}

	public static FileOutputStream outputFile;
	static FileInputStream file;
	public static final String TEST_CASES = GlobalVariable.TestResultFile;
	int rowCount;
	String xl = TEST_CASES;
	String sheet = "Summary";

	@Keyword
	def testingHTML() {


		String th="border: 1px solid #ddd;padding: 8px;padding-top: 12px;padding-bottom: 12px;text-align: left;background-color: #5b9bd5;color: white;";
		StringBuffer pw = new StringBuffer();
		pw.append("<html><body>Dear Team,<BR/><BR/>Please find the attached Test Result for the last API testing on DEV environment.<BR/>")
		pw.append(
				"<h3>API Automation Test Execution Report Summary</h3>");
		pw.append("<head><TABLE style='font-family:Georgia, serif;border-collapse: collapse;width:80%;border:1px solid #ddd;padding:8px;'><TR style='background-color: #ddd';><TH style='"+th+"'>ModuleName<TH style='"+th+"'>NoOfTestCases<TH style='"+th+"'>PASS<TH style='"+th+"'>FAIL</TR>");


		rowCount = getRowCount(xl, sheet)
		System.out.println(rowCount);

		String css = "background-color: #f2f2f2;";
		String td  ="border: 1px solid #ddd;padding: 8px;";

		for (int i = 1; i <= rowCount; i++) {
			String moduleName = getCellValue(xl, sheet, i, 0);
			System.out.println(moduleName);
			String noOfTestCases = getCellValue(xl, sheet, i, 1);
			String passCount = getCellValue(xl, sheet, i, 2);
			String failCount = getCellValue(xl, sheet, i, 3);

			pw.append("<TR style='"+css+"'><TD style='"+td+"'>" + moduleName + "<TD style='"+td+"'>" + noOfTestCases + "<TD style='"+td+"'>" + passCount + "<TD style='"+td+"'>" + failCount);
		}

		pw.append("</TABLE></head><BR/>Regards,<BR/>Automation Team</body></html>");
		//pw.close();
		return pw;

	}

	@Keyword
	def getCellValue(String xl, String sheet, int row, int cell) {

		def val = "";
		try {
			FileInputStream file = new FileInputStream (xl);
			XSSFWorkbook workbook = new XSSFWorkbook(file);

			XSSFCell cell1 = workbook.getSheet(sheet).getRow(row).getCell(cell);

			switch(cell1.getCellType()){
				case XSSFCell.CELL_TYPE_NUMERIC:
					val = cell1.getNumericCellValue() + "";
				case XSSFCell.CELL_TYPE_STRING:
					val = cell1.getStringCellValue() + "";
				case XSSFCell.CELL_TYPE_FORMULA:
					XSSFFormulaEvaluator.evaluateAllFormulaCells(workbook);
					val = cell1.getNumericCellValue() + "";
					return val.substring(0, val.indexOf('.'));

					file.close();
			}
		}catch(Exception e){

			println(e.getStackTrace().toString())
		}
		return val;
	}

	@Keyword
	def getRowCount(String xl, String sheet) {

		try {
			FileInputStream files = new FileInputStream(xl);
			XSSFWorkbook workbook = new XSSFWorkbook(files);
			return workbook.getSheet(sheet).getLastRowNum();
		} catch (Exception e) {
			return 0;
		}
	}

	@Keyword
	def getRowCount(String sheet, int row, int cell, String result) {

		FileInputStream file = new FileInputStream(GlobalVariable.TestResultFile);
		XSSFWorkbook workbook = new XSSFWorkbook(file);
		XSSFSheet sheets = workbook.getSheet(sheet);
		FileOutputStream output = new FileOutputStream(GlobalVariable.TestResultFile);

		sheets.getRow(row).createCell(cell).setCellValue(result);
		workbook.setForceFormulaRecalculation(true);

		workbook.write(output);
		output.close();
	}*/
}
