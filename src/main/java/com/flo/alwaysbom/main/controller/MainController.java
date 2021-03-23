package com.flo.alwaysbom.main.controller;

import com.flo.alwaysbom.main.service.MainService;
import com.flo.alwaysbom.main.vo.MainVo;
import com.flo.alwaysbom.util.FileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    @GetMapping("/")
    public String main() {
        return "main/index";
    }
}
