package com.Rest_Api.web.utilities;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Iterator;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@SuppressWarnings("unused")
public class ExcelUtils {

    private XSSFSheet ExcelWSheet;
	private XSSFWorkbook ExcelWBook;
	private XSSFCell Cell;
	private XSSFRow Row;
	private XSSFCell HeaderCell;
	private XSSFRow HeaderRow;

	public void ReadExcelFile(String Path,String SheetName)throws Exception{
		try{
			setExcelFile(Path);
			setExcelWorkSheet(SheetName);
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
	}

	public XSSFWorkbook setExcelFile(String Path)throws Exception{
		try{
			FileInputStream ExcelFile = new FileInputStream(Path);
			ExcelWBook = new XSSFWorkbook(ExcelFile);
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
		return ExcelWBook;
	}

	public XSSFSheet setExcelWorkSheet(String SheetName)throws Exception{
		try{
			ExcelWSheet = ExcelWBook.getSheet(SheetName);
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
		return ExcelWSheet;
	}

	public int getRowCount() throws Exception{
		return ExcelWSheet.getLastRowNum();
	}

	public int getColumnCount(int RowNum) throws Exception{
		return ExcelWSheet.getRow(RowNum).getLastCellNum();
	}

	public String getCellData(int RowNum, int ColNum) throws Exception{
		String CellData = null;
		try{
			Cell = ExcelWSheet.getRow(RowNum).getCell(ColNum);
			CellData = Cell.getStringCellValue();
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
		return CellData;
	}

	public void setCellData(String Result,  int RowNum, int ColNum) throws Exception	{
		try{
			Row  = ExcelWSheet.getRow(RowNum);
			Cell = Row.getCell(ColNum);
			if (Cell == null) {
				Cell = Row.createCell(ColNum);
				Cell.setCellValue(Result);
			} else {
				Cell.setCellValue(Result);
			}
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
	}

	private XSSFWorkbook getExcelWBook(String Path,String SheetName) {
		try {
			ExcelWBook = new XSSFWorkbook();
			ExcelWSheet = ExcelWBook.createSheet(SheetName);		      
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
		return ExcelWBook;
	}
	
	public void saveExcelFile(String Path)throws Exception{
		try{
			FileOutputStream fileOut = new FileOutputStream(Path);
			ExcelWBook.write(fileOut);
			fileOut.flush();
			fileOut.close();
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
	}

	@SuppressWarnings("rawtypes")
	public void printExcelData() throws Exception{
		try{
			//Iterator rows = ExcelWSheet.rowIterator();
			int rows = ExcelWSheet.getLastRowNum();
			for(int r = 1; r < rows; r++){
	        		Row = ExcelWSheet.getRow(r);

				//while (rows.hasNext()){
				//Row = (XSSFRow) rows.next();
				System.out.print("*******************");
				Iterator cells = Row.cellIterator();
					while (cells.hasNext()){
						Cell = (XSSFCell) cells.next();
						HeaderCell = ExcelWSheet.getRow(0).getCell(Cell.getColumnIndex());
						if (Cell.getCellType() == 1){
							System.out.print(HeaderCell.getStringCellValue() +" = "+ Cell.getStringCellValue()+" ");
						}else if(Cell.getCellType() == 0){
							System.out.print(HeaderCell.getStringCellValue() +" = "+ Cell.getNumericCellValue()+" ");
						}else{
							//U Can Handel Boolean, Formula, Errors
						}
					}
				}
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
		}
	}
	//***********************************************************************
	//***********************************************************************

	
}
