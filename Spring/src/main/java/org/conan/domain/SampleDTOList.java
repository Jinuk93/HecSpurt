package org.conan.domain;

import java.util.ArrayList;
import java.util.List;
import lombok.Data;

@Data
public class SampleDTOList {
	private List<SampleDTO> list;
	private SampleDTOList() {
		list = new ArrayList<>();
	}
}
