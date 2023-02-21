package com.Rest_Api.web.utilities;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.math.BigDecimal;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

public class DataUtils {

	/**
	 * [Return cell data from a given file, column name and row number]
	 * 
	 * @param [DataFile  - Full path and name of the excel file to read]
	 * @param [SheetName - Worksheet name to retrieve the value from]
	 * @param [RowNumber - Row to get the value from]
	 * @param [ColumName - Column name to get the value from]
	 * @return [Cell Data]
	 * @exception [Does not search through all worksheets]
	 * @see []
	 **/
	public static String getCellData(String dataFile, String sheetName, int rowNum, String column) {

		String retCellValue = null;
		Row firstRow = null;
		Row dataRow = null;
		Cell dataCell = null;
		Cell firstCell = null;
		boolean columnFound = false;

		try {
			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(new File(dataFile)));
			HSSFSheet sheet = workbook.getSheet(sheetName);
			// Get current row object.
			firstRow = sheet.getRow(0);
			// Loop in the row cells.
			for (int i = firstRow.getFirstCellNum(); i < firstRow.getLastCellNum(); i++) {
				// Get current cell.
				firstCell = firstRow.getCell(i);
				if (firstCell != null) {
					if (firstCell.getStringCellValue().equalsIgnoreCase(column)) { // if columns found

						columnFound = true;
						dataRow = sheet.getRow(rowNum);
						dataCell = dataRow.getCell(i);

//						CellType cellType = dataCell.getCellType();
//						if (cellType.name().equalsIgnoreCase("numeric")) {
//							double numberValue = dataCell.getNumericCellValue();
//							retCellValue = BigDecimal.valueOf(numberValue).toPlainString();
//						} else if (cellType.name().equalsIgnoreCase("string")) {
//							retCellValue = dataCell.getStringCellValue();
//						} else if (cellType.name().equalsIgnoreCase("boolean")) {
//							boolean numberValue = dataCell.getBooleanCellValue();
//							retCellValue = String.valueOf(numberValue);
//						} else
//							System.out.println(cellType.name());
					}

				}
				// If the row has been found then exit the for loop
				if (columnFound) {
					break;
				}
			}
			// Close excel work book object.
			workbook.close();
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
		return retCellValue;
	}

	/**
	 * [Set cell data from a given file, column name and row number]
	 * 
	 * @param [DataFile  - Full path and name of the excel file to read]
	 * @param [SheetName - Worksheet name to retrieve the value from]
	 * @param [RowNumber - Row to get the value from]
	 * @param [ColumName - Column name to get the value from]
	 * @param [Cell      Data]
	 * @exception [Does not search through all worksheets]
	 * @see []
	 **/
	public static void setCellData(String dataFile, String sheetName, int rowNum, String colName, String cellValue) {

		Cell firstCell = null;
		Cell dataCell = null;
		boolean columnFound = false;

		try {
			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(new File(dataFile)));
			HSSFSheet sheet = workbook.getSheet(sheetName);
			// Get current row object.
			Row row = sheet.getRow(0);
			// Loop in the row cells.
			for (int i = row.getFirstCellNum(); i < row.getLastCellNum(); i++) {

				// Get current cell.
				firstCell = row.getCell(i);
				if (firstCell.getStringCellValue().equalsIgnoreCase(colName)) {
					columnFound = true;
					dataCell = sheet.getRow(rowNum).createCell(i);
					dataCell.setCellValue(cellValue);
				}

				// if the column has been found then exit the for loop
				if (columnFound) {
					break;
				}
			}

			FileOutputStream outFile = new FileOutputStream(new File(dataFile));
			workbook.write(outFile);
			outFile.close();
			workbook.close();

		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
	}

}
