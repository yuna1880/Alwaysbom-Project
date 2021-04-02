package com.flo.alwaysbom.subs.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class SubsController {


    @GetMapping("/subs")
    public String goIndex () {
        System.out.println("여기");
        return "subs/subsMain";
    }








}
