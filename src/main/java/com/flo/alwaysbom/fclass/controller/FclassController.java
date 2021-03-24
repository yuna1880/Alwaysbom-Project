package com.flo.alwaysbom.fclass.controller;

import com.flo.alwaysbom.fclass.service.FclassService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class FclassController {

    private final FclassService service;

    @GetMapping("/fclass/classDetail")
    public String goDetail() {

        return "fclass/b_detail";
    }

    @GetMapping("/fclass/classList")
    public String goList() {
        return "fclass/b_classList";
    }
}
