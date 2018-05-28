package com.itss.matrix.model;

public class FormatCheckSolution {
	public FormatCheckSolution(){}
	
	/**파일형식 검사*/
	public static boolean isFileFormat(String file) {
		boolean result = false;
		if(file==null) {
			return true;
		}
		file=file.toLowerCase();
		String[] texts= file.split("\\.");
		String format = texts[texts.length-1];
		switch (format) {
		case "pdf" :
		case "doc":
		case "docx":
		case "hwp":
		case "xls":
		case "xlsx":
		case "png":
		case "jpg":
		case "jpeg":
			result=true;
			break;
		}
		return result;
	}
	
	/**번호 형식 검사*/
	public static boolean isNumberFormat(String num){
		boolean result=false;
		if(num==null){
			return true;
		}
		try{
			Integer.parseInt(num);
			result = true;
		} catch(NumberFormatException e){
		}
		
		return result;
	}
	
	/**입력값 길이 검사*/
	public static boolean isInputLength(String input, int min, int max) {
		boolean result = false;
		if(input==null) {
			return true;
		}
		if((input.length()>=min)&&(input.length()<=max)){
			result=true;
		}
		
		return result;
	}
	
}
