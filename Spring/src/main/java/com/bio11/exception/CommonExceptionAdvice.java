package com.bio11.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {
	@ExceptionHandler(Exception.class)
	public String exception(Exception ex, Model model) {
		log.error("Exception..." + ex.getMessage());
		model.addAttribute("exceptioin", ex);
		log.error(model);
		return "error_page";
	}
}
