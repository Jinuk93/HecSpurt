package com.spring.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.BoardAttachVO;
import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;

	
	@GetMapping("/register")
	public void register() {
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr ) {
		log.info("register : " + board);
		if(board.getAttachList() != null){
			board.getAttachList().forEach(attach->log.info("register Attach :" + attach));
		}
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno()); //addFlashAttribute는 딱 한번 보여주고 사라진다.
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public void list(Model model,  Criteria cri) {
		log.info("list");
		model.addAttribute("list", service.getListWithSearch(cri));
		model.addAttribute("count", service.getTotal(cri));
		log.info("count : >>>>>>>>>>" + service.getTotal(cri));
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get or /modify");
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String get(BoardVO board, RedirectAttributes rttr) {
		log.info("modify : " + board);
		if(board.getAttachList() != null){
			board.getAttachList().forEach(attach->log.info("Modify Attach : " + attach));
		}
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno")Long bno, RedirectAttributes rttr) {
		log.info("remove...." + bno);
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		if(service.remove(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	 @GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	 public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		 log.info("getAttachList" + bno);
		 return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 

	 private void deleteFiles(List<BoardAttachVO> attachList) {
		 if(attachList == null || attachList.size() == 0 ) {
			 return;
		 }
		 log.info("delete attach files...........");
		 log.info(attachList);
		 attachList.forEach(attach->{
			 try {
				 Path file = Paths.get("/Users/soyoonbeom/Spring_STS3_workspace/upload" + attach.getUploadPath() + "/" + attach.getUuid() + "_" + attach.getFileName());
				 Files.deleteIfExists(file);
				 if(Files.probeContentType(file).startsWith("image")) {
					 Path thumbNail = Paths.get("/Users/soyoonbeom/Spring_STS3_workspace/upload" + attach.getUploadPath()+"/s_"+ attach.getUuid()+"_" + attach.getFileName());
					 Files.delete(thumbNail);
				 }
			 }catch(Exception e) { log.error("delete file error : " + e.getMessage());}
		 });//forEach 
	}
		 
}
