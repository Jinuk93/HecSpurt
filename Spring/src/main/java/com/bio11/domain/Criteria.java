package com.bio11.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@NoArgsConstructor // 기본생성자 생성
@AllArgsConstructor // 모든필드를 초기화 한다
public class Criteria {
	private String type;
	private String keyword;
	private String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
}
