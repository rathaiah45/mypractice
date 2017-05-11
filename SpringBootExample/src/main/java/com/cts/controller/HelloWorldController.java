package com.cts.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {
	@RequestMapping(value = "/welcome")
	public String getWelcome() {
		return "HelloWorld";
	}
}
