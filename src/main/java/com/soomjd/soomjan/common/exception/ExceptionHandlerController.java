package com.soomjd.soomjan.common.exception;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @author 임예람
 *
 * 공통 에러 핸들러
 */
@ControllerAdvice
public class ExceptionHandlerController{
	
	/*
	 * @ExceptionHandler(Exception.class) public Map<String, String>
	 * handlerException(Exception e){
	 * 
	 * Map<String, String> errMessageMap = new HashMap<>();
	 * errMessageMap.put("errMessage", e.getMessage());
	 * System.out.println(errMessageMap);
	 * 
	 * return errMessageMap; }
	 */
}
