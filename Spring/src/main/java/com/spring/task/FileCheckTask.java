package com.spring.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.domain.BoardAttachVO;
import com.spring.mapper.BoardAttachMapper;
import com.spring.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//Task 작업 처리 이미 삭제된 파일 데이터 저장위치에서 삭제하는 기능 클래스
@Log4j
@Component
@AllArgsConstructor //생성자에 의한 주입
public class FileCheckTask {
	
	private BoardAttachMapper attachMapper;
	
	//cron : 시간 단위의 값을 조정해서 주기 설정
	@Scheduled(cron="0 * * * * *") //cron = "s m h D M W (Y)"
	public void checkFiles() throws Exception {
		log.warn("file check task run.....");
		log.warn("====================================");
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();//테이블에 저장된 어제 날짜의 파일 정보
		List<Path> fileListPaths = fileList.stream()
		.map(vo->Paths.get("/Users/soyoonbeom/Spring_STS3_workspace/upload", vo.getUploadPath(),vo.getUuid()+"_"+vo.getFileName()))
		.collect(Collectors.toList());
		fileList.stream().filter(vo -> vo.isFileType() == true)//이미지인 경우 썸네일을 목록에 추가
		.map(vo->Paths.get("/Users/soyoonbeom/Spring_STS3_workspace/upload",vo.getUploadPath(),"s_"+vo.getUuid()+"_"+vo.getFileName()))
		.forEach(p->fileListPaths.add(p));
		log.warn("=====================================");
		fileListPaths.forEach(p->log.warn(p));
		File targetDir = Paths.get("/Users/soyoonbeom/Spring_STS3_workspace/upload", getFolderYesterDay()).toFile(); //서버에 저장된 어제 날짜의 파일
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths
		.contains(file.toPath())== false );  //서버의 파일들 중테이블 정보와 다른 것들을 제거 파일로
		log.warn("======================");
		for(File file:removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
	}
	
	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String str = sdf.format(cal.getTime());
		return str.replace("-", File.separator);
	}
}
