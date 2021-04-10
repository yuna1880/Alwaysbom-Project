package com.flo.alwaysbom.main.controller;

import com.flo.alwaysbom.flower.service.FlowerService;
import com.flo.alwaysbom.flower.vo.FlowerVo;
import com.flo.alwaysbom.subs.service.SubsService;
import com.flo.alwaysbom.subs.vo.SubsVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final FlowerService flowerService;
    private final SubsService subsService;

    @GetMapping("/")
    public String main(Model model) {
        List<SubsVo> subsList = subsService.findAll();
        List<FlowerVo> flowerList = flowerService.findRecent4();
        model.addAttribute("subsList", subsList);
        model.addAttribute("flowerList", flowerList);
        return "main/index";
    }


}
