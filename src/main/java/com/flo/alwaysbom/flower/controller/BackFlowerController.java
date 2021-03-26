package com.flo.alwaysbom.flower.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class BackFlowerController {

    @GetMapping("/admin/flower")
    public String getIndex() {
        return "flower/b_management";
    }

    @GetMapping("/admin/flowerInsert")
    public String goInsert() {
        return "flower/b_insert";
    }

}
