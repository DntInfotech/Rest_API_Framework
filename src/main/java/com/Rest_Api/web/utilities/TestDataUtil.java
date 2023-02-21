package com.Rest_Api.web.utilities;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class TestDataUtil {
	
	private XSSFWorkbook TestDataWBook;
    private XSSFSheet TestDataWSheet;
	private XSSFCell Cell;
	private XSSFRow Row;
	private XSSFCell HeaderCell;
	private XSSFRow HeaderRow;
	
	private HSSFWorkbook HTestDataWBook;
	private HSSFSheet HTestDataWSheet;
	private Cell Hcell;
	private Row HRow;
	private Cell HHeaderCell;
	private Row HHeaderRow;
	
	private HSSFWorkbook wb;
	private HSSFSheet ws;
	
	public int rowCount = 0;
	public int colCount = 0;
	public int testDataRowCount = 0;
	//public int resultDataRowCount = 0;
	
	private LocalDateTime date = LocalDateTime.now();
	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy_MM_dd_hh_mm_ss");
	private String dateTime = date.format(formatter);
	  
	public String testResultFilepath = System.getProperty("user.dir")+"\\test-output\\TestResult" + dateTime + ".xls";
	
	private LinkedHashMap<Integer, LinkedHashMap<String, String>> testDataDetails = new LinkedHashMap<Integer, LinkedHashMap<String, String>>();
	
	public void readTestData(String testDataExcelFilePath, String testDataExcelWorkSheet){
		
		try {
			testDataDetails.clear();
			
			if (FilenameUtils.getExtension(testDataExcelFilePath).equalsIgnoreCase("xlsx")) {
				readXLSXFile(testDataExcelFilePath,testDataExcelWorkSheet);
			}
			
			if (FilenameUtils.getExtension(testDataExcelFilePath).equalsIgnoreCase("xls")) {
				readXLSFile(testDataExcelFilePath,testDataExcelWorkSheet);
			}
			
			testDataRowCount = testDataDetails.size();
		
		}catch (Exception e){
			System.out.print("Exception happened to setTestData: " + e.toString());
		}
	}
	
	private void readXLSXFile(String testDataExcelFilePath, String testDataExcelWorkSheet){
		try{
			FileInputStream ExcelFile = new FileInputStream(testDataExcelFilePath);
			TestDataWBook = new XSSFWorkbook(ExcelFile);
			
			TestDataWSheet = TestDataWBook.getSheet(testDataExcelWorkSheet);
			
			rowCount = TestDataWSheet.getLastRowNum()+1;
			colCount = TestDataWSheet.getRow(0).getLastCellNum();

			for(int r = 1; r < rowCount; r++){
				LinkedHashMap<String, String> testData = new LinkedHashMap<String, String>();
				XSSFRow Row = TestDataWSheet.getRow(r);

				for(int c = 0; c < colCount; c++){
				HeaderCell = TestDataWSheet.getRow(0).getCell(c);
				XSSFCell Cell = Row.getCell(c);
					
					try{						
						if (Cell.getCellType() == 1){
							testData.put(HeaderCell.getStringCellValue(),Cell.getStringCellValue());
						}else if(Cell.getCellType() == 0){
							testData.put(HeaderCell.getStringCellValue(),String.valueOf(Cell.getNumericCellValue()));
						}
					}catch(Exception e){
						testData.put(HeaderCell.getStringCellValue(),"");
					}
				
				}
				testDataDetails.put(r,testData);
			}
					
		}catch (Exception e){
			System.out.print("Exception happened to setTestData: " + e.toString());
		}
	}
	
	public String getTestData(int RowNumber, String rowHeader){
		String retCellData = null;
		try{
			for (Entry<Integer, LinkedHashMap<String, String>> entry : testDataDetails.entrySet()){
				if (entry.getKey().equals(RowNumber)){
		      		for (Map.Entry<String,String> entry1 : entry.getValue().entrySet()){		      			
		      			if (entry1.getKey().equals(rowHeader)){
		      				retCellData = entry1.getValue().toString();
		      				break;
			      		}
		      		}
		      	}
		      }
		}catch (Exception e){
			System.out.print(e.toString());
		}
		return retCellData;
	}

	private void readXLSFile(String testDataExcelFilePath, String testDataExcelWorkSheet){
		try{
			FileInputStream ExcelFile = new FileInputStream(testDataExcelFilePath);
			HTestDataWBook = new HSSFWorkbook(ExcelFile);
			
			HTestDataWSheet = HTestDataWBook.getSheet(testDataExcelWorkSheet);
			
			FormulaEvaluator evaluator = HTestDataWBook.getCreationHelper().createFormulaEvaluator();
			
			rowCount = HTestDataWSheet.getLastRowNum()+1;
			colCount = HTestDataWSheet.getRow(0).getLastCellNum();

			for(int r = 1; r < rowCount; r++){
				LinkedHashMap<String, String> testData = new LinkedHashMap<String, String>();
				HRow = HTestDataWSheet.getRow(r);

				for(int c = 0; c < colCount; c++){
					HHeaderCell = HTestDataWSheet.getRow(0).getCell(c);
					Hcell = HRow.getCell(c);
					
					try{
						if ((Hcell.toString().length() > 0)) {
							testData.put(HHeaderCell.getStringCellValue(),Hcell.toString());
						}
						
						/*CellType cellType = Hcell.getCellType();
						
						if ((cellType.name().equalsIgnoreCase("numeric")) || (!cellType.name().equalsIgnoreCase("blank"))) {
							double numberValue = Hcell.getNumericCellValue();
							testData.put(HHeaderCell.getStringCellValue(),BigDecimal.valueOf(numberValue).toPlainString());
						} else if ((cellType.name().equalsIgnoreCase("string")) || (!Hcell.getStringCellValue().isEmpty()) || (!cellType.name().equalsIgnoreCase("blank")) ) {
							testData.put(HHeaderCell.getStringCellValue(),Hcell.getStringCellValue());
						} else if ((cellType.name().equalsIgnoreCase("boolean")) || (!cellType.name().equalsIgnoreCase("blank")) ) {
							boolean numberValue = Hcell.getBooleanCellValue();
							testData.put(HHeaderCell.getStringCellValue(),String.valueOf(numberValue));
						}*/
						
					}catch(Exception e){
						//testData.put(HHeaderCell.getStringCellValue(),"");
					}
				} 
				if(testData.size() > 0) {
					testDataDetails.put(r,testData);
				}
			}
					
		}catch (Exception e){
			System.out.print("Exception happened to setTestData: " + e.toString());
		}
	}

	public void setWorkbook() {

		try {
			wb = new HSSFWorkbook();
			ws = wb.createSheet("TestResult");
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
	}
	
	public int getresultDataRowCount() {
		int resultDataRowCount = 0;
		try {
			resultDataRowCount = ws.getLastRowNum();
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
		return resultDataRowCount;
	}
	
	public void saveWorkbook() {

		try {
			FileOutputStream outFile = new FileOutputStream(new File(testResultFilepath));
			wb.write(outFile);
			outFile.close();
			wb.close();
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
	}
	
	public void setCellData(int rowNum, int colNum, String cellValue) {
		Row row = ws.getRow(rowNum);
			if(row == null) {
				row  = ws.createRow(rowNum);
			}
			
			Cell cell = row.getCell(colNum);
			
				if (cell == null) {
					cell = row.createCell(colNum);
					cell.setCellValue(cellValue);
				} else {
					cell.setCellValue(cellValue);
				}
		}
}
