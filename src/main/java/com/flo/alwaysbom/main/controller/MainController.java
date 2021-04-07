package com.flo.alwaysbom.main.controller;

import com.flo.alwaysbom.flower.service.FlowerService;
import com.flo.alwaysbom.flower.vo.FlowerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final FlowerService flowerService;

    @GetMapping("/")
    public String main(Model model) {
        List<FlowerVo> flowerList = flowerService.findAll();
        model.addAttribute("flowerList", flowerList);
        return "main/index";
    }


}
