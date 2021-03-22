package com.flo.alwaysbom.front.community.faq.controller;

import com.flo.alwaysbom.front.community.faq.service.FaqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FaqController {

    @Autowired
    private final FaqService service;

    public FaqController(FaqService service) {
        this.service = service;
    }

    @GetMapping("goFaq")
    public String goFaq() {

        return "community/faq";
    }
}
