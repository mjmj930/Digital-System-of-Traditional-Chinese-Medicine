package me.mj.tcmdigit.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("hello")

public class helloworld {
    @RequestMapping("/helloworld")
    public String helloworld(){
        return "hello";
    }

}
