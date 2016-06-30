package com.cz.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@org.springframework.web.bind.annotation.RestController
@RequestMapping("/rest")
public class RestController {

	private SimpMessagingTemplate template;

	@Autowired
	public RestController(SimpMessagingTemplate template) {
		this.template = template;
	}

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public void trigger() {
		this.template.convertAndSend("/topic/message", "Date: " + new Date());
	}

}
