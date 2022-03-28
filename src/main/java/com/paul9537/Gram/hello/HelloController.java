package com.paul9537.Gram.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
	
	@GetMapping("/helloworld")
	@ResponseBody
	public String helloWorld() {
		return "Hello World!!!";
	}
}
