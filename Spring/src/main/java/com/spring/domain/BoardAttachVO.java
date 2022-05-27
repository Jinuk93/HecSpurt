package com.spring.domain;

import lombok.Data;

//CREATE TABLE tbl_attach(
//	    uuid varchar2(100) NOT NULL,
//	    uploadPath varchar2(200) NOT NULL,
//	    fileName varchar2(100) NOT NULL,
//	    fileType char(1) DEFAULT'I',
//	    bno number(10,0)
//	    );
//	ALTER TABLE tbl_attach ADD CONSTRAINT pk_attach PRIMARY KEY(uuid);
//	ALTER TABLE tbl_attach ADD CONSTRAINT fk_board_attach FOREIGN KEY(bno) REFERENCES tbl_board(bno);

@Data
public class BoardAttachVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType; //이미지 파일 여부
	private Long bno;
}
