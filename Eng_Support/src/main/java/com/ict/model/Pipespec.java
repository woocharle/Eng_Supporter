package com.ict.model;

import java.util.Arrays;
import java.util.List;

public class Pipespec {
	String[] arr1 = { "1/8", "1/4", "3/8", "1/2", "3/4", "1", "1 1/4", "1 1/2", "2", "2 1/2", "3", "3 1/2", "4", "5",
			"6", "8", "10", "12", "14", "16", "18", "20", "22", "24", "26", "28", "30", "32", "34", "36" };

	String[] arr2 = { "STD", "40", "80", "160", "XS", "XXS", "5S", "10S", "40S", "80S", "10", "20", "30", "60", "100",
			"120", "140" };

	List<String> size = Arrays.asList(arr1);
	List<String> schedule = Arrays.asList(arr2);

	public List<String> getSize() {
		List<String> list = null;

		list = size;

		return list;
	}

}
