package com.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Criteria {
	private String type;
	private String keyword;
	public String[] getTypeArr() {
		//검색 조건을 배열로 만들어 한꺼번에 처리
		//MyBatis는 Java Beans의 규칙을 엄격하게 지키지 않음
		return type==null? new String[] {}: type.split("");
	}

}
