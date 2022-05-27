package com.spring.sample;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.ToString;

@Component
@ToString
@Getter
@AllArgsConstructor //(or @RequiredArgsConstructor)
public class SampleHotel {
	@NonNull
	private Chef chef;
	
	/*
	 	public SampleHotel(Chef chef) {
			this.chef = chef;
		}
	*/
}
