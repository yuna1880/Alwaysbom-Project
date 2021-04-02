package com.flo.alwaysbom.subs.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class BackSubsController {

    //백오피스 정기구독 이동
    @GetMapping("/admin/subs")
    public String goIndex() {
        return "subs/b_subsManager";
    }
    //백오피스 정기구독 상품등록 이동
    @GetMapping("/admin/addForm")
    public String goAddForm() {
        return "subs/b_addForm";
    }
    @PostMapping("/admin/addSubs")
    public String addSubs() {
        return "redirect:admin/subsList";
    }


}
