package com.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.BoardAttachVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j
@Controller
@AllArgsConstructor
public class UploadController {
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("uploadajax");
	}
	
	@PostMapping(value="/uploadAjaxAction",produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		String uploadFolder = "/Users/soyoonbeom/Spring_STS3_workspace/upload";
		List<BoardAttachVO> list = new ArrayList<>();
		//폴더 생성하기 
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload Path : " + uploadPath);
		if(uploadPath.exists() == false) { //폴더가 존재하지 않으면 새로 생성
			uploadPath.mkdirs(); //yyyy/MM/dd폴더 생성
		}
		System.out.println(uploadFile.length +" ///////////");
		
		for(MultipartFile multipartFile: uploadFile) {
			
			BoardAttachVO attachVO = new BoardAttachVO();
			//로그 출력
			log.info("-----------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			//중복된 이름의 파일 처리
			UUID uuid = UUID.randomUUID();
			String uploadFileName = multipartFile.getOriginalFilename();//파일이름 수정 
			attachVO.setFileName(uploadFileName);
			uploadFileName = uuid.toString()+'_'+uploadFileName;
//			File saveFile = new File(uploadPath, multipartFile.getOriginalFilename());
			File saveFile = new File(uploadPath, uploadFileName);
			try {
				multipartFile.transferTo(saveFile);
				attachVO.setUuid(uuid.toString());
				attachVO.setUploadPath(getFolder());
				if(checkImageType(saveFile)) {
					attachVO.setFileType(true);
					FileOutputStream thumbnail
					= new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),
							thumbnail, 100, 100);
					thumbnail.close();
				}
				list.add(attachVO);
				log.info("attachVO: " + attachVO);
			}catch(Exception e) { log.error(e.getMessage()); }
		}//end for
		return new ResponseEntity<>(list,HttpStatus.OK);
	}//end uploadAjaxPost
	
	
	
	//중복된 이름의 파일 처리
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-",File.separator);
	}
	
	//썸네일을 처리하는 단계
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		}catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//썸네일 이미지 보여주기
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]>getFile(String fileName){
		log.info("fileName : " + fileName);
		File file = new File("/Users/soyoonbeom/Spring_STS3_workspace/upload/"+fileName);
		log.info("file: " + file);
		ResponseEntity<byte[]> result = null;
		try {
				HttpHeaders header = new HttpHeaders();
				header.add("Content-Type", Files.probeContentType(file.toPath()));
				//적당한 MIME 타입을 헤더에 추가
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
						header, HttpStatus.OK);
		}catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//첨부파일 다운로드
	@GetMapping(value="/download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downLoadFile(String fileName){
		log.info("download file : " + fileName);
		Resource resource = new FileSystemResource("/Users/soyoonbeom/Spring_STS3_workspace/upload/"+fileName);
		if(resource.exists() == false) {return new ResponseEntity<>(HttpStatus.NOT_FOUND);}
		log.info("resource : " + resource);
		String resourceName = resource.getFilename();
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		log.info("resourceOriginalName: " + resourceOriginalName);
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Disposition", "attachment; fileName="
					+ new String(resourceName.getBytes("UTF-8"),"ISO-8859-1")); 
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		log.info("delete : "  + fileName);
		File file;
		try {
			file = new File("/Users/soyoonbeom/Spring_STS3_workspace/upload/"+URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("largeFilName : " + largeFileName);
				file = new File(largeFileName);
				file.delete();
			}
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	
	
}
