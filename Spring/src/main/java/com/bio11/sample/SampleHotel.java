package com.bio11.sample;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.ToString;

@AllArgsConstructor // or @RequiredArgsConstructor)
@Component
@ToString
@Getter
public class SampleHotel {
	@NonNull
	private Chef chef;
	// 이걸 주석하려면 @AllArgsConstructor 선언되어있어야
//	public SampleHotel(Chef chef) {
//		this.chef = chef;
//	}
}
