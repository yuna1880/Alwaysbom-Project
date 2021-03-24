package com.flo.alwaysbom.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OitemController {
    //편지 페이지로 이동
    @GetMapping("/goLetter")
    public String goLetter() { return "order/letter"; }
}
