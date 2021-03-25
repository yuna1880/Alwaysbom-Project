package com.flo.alwaysbom.order.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class OitemController {


    //편지 페이지로 이동
    @GetMapping("/goLetter")
    public String goLetter() {
        return "order/letter";
    }

    //배송지입력 화면으로 이동
    @PostMapping("/checkOut")
    public String checkOut() {


        return "order/checkout";
    }



}
