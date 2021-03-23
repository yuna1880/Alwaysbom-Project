package com.flo.alwaysbom.front.fclass.controller;

import com.flo.alwaysbom.front.fclass.service.FclassService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class FclassController {

    private final FclassService service;

    @GetMapping("/fclass/detail")
    public String goDetail() {

        return "/fclass/detail";
    }

    @GetMapping("/fclass/list")
    public String goList() {
        return "/fclass/classList";
    }
}
