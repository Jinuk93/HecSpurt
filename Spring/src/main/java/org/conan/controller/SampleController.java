package org.conan.controller;

import java.util.ArrayList;
import java.util.Arrays;

import org.conan.domain.SampleDTO;
import org.conan.domain.SampleDTOList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sample/*")
public class SampleController {

	@RequestMapping(value="/basic", method= {RequestMethod.GET})
	public void basicGet() {
		log.info("basic get.....");
	}
	@GetMapping("/only") //스프링 4.3 이후
	public void onlyGet() {
		log.info("only get.....");
	}
	@GetMapping("/ex01") //스프링 4.3 이후
	public String ex01(SampleDTO dto) {
		log.info("" + dto);
		return "ex01";
	}
	@GetMapping("/ex02") //스프링 4.3 이후
	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {
		log.info("name" + name);
		log.info("age" + age);
		return "ex02";
	}
	@GetMapping("/ex02Array") //스프링 4.3 이후
	public String ex02Array(@RequestParam("ids") String[]ids) {
		log.info("array ids : " + Arrays.toString(ids));
		return "ex02List";
	}
//	@GetMapping("/ex02List") //스프링 4.3 이후
//	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
//		log.info("ids : " + ids);
//		return "ex02List";
//	}
	@GetMapping("/ex02Bean") //스프링 4.3 이후
	public String ex02Bean(SampleDTOList list) {
		log.info("list dtos : " +list);
		return "ex02Bean";
	}
	@GetMapping("/ex04") //스프링 4.3 이후
	public String ex04(SampleDTO dto, int page) {
		log.info("dto : " + dto);
		log.info("page : " + page);
		return "/sample/ex04";
	}
	@GetMapping("/ex06") //스프링 4.3 이후
	public @ResponseBody SampleDTO ex06() {
		log.info("ex06.............. ");
		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("conan");
		return dto;
	}
//	@GetMapping("/ex07") //스프링 4.3 이후
//	public ResponseEntity<String> ex07() {
//		log.info("ex07.............. ");
//		String msg = String.format("{\"name\":\"conan\"}");
//		HttpHeaders header = new HttpHeaders();
//		header.add("Content-Type", "application/json;charset=UTF-8");
//		return new ResponseEntity<>(msg, header, HttpStatus.OK);
//	}
	@GetMapping("/exUpload")
	public void exUpload() {
		log.info("exUpload.....");
	}
	@PostMapping("/exUploadPost")
	public void exUploadPost(ArrayList<MultipartFile>files) {
		for(MultipartFile file:files) {
			log.info("name :" + file.getOriginalFilename());
			log.info("size :" + file.getSize());
		}
	}
}
