package com.flo.alwaysbom.flower.controller;

import com.flo.alwaysbom.flower.service.FlowerService;
import com.flo.alwaysbom.flower.vo.FlowerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class FlowerController {

    private final FlowerService flowerService;

//    @GetMapping("/flower")
//    public String getList() {
//        return "flowerList";
//    }

    @GetMapping("/flower/detail")
    public String getOne() {
        return "flower/detail";
    }

    @GetMapping("/flower")
    public String findAll(Model model) {
        List<FlowerVo> list = flowerService.findAll();
        model.addAttribute("list", list);
        return "flower/flowerList";
    }
}
