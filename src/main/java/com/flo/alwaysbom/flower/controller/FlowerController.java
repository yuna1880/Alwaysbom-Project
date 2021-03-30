package com.flo.alwaysbom.flower.controller;

import com.flo.alwaysbom.flower.service.FlowerServiceImpl;
import com.flo.alwaysbom.flower.vo.FlowerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class FlowerController {

    private final FlowerServiceImpl flowerService;

    @GetMapping("/flower/test")
    public String goTest(){
        return "flower/test";
    }

    @GetMapping("/flower")
    public String findAll(Model model) {
        List<FlowerVo> list = flowerService.findAll();
        model.addAttribute("list", list);
        return "flower/flowerList";
    }

    @GetMapping("/flower/{idx}")
    public String getOne(@PathVariable("idx") Integer idx, Model model) {
        FlowerVo flower = flowerService.findByIdx(idx)
                .orElseThrow(() -> new IllegalStateException("해당 상품 인덱스가 존재하지 않습니다"));
        model.addAttribute("idx", idx);
        model.addAttribute("flowerVo", flower);
        return "flower/flowerDetail";
    }

    @GetMapping("/flower/{idx}/get")
    @ResponseBody
    public FlowerVo findFlowerByIdx(@PathVariable("idx") Integer idx) {
        return flowerService.findByIdx(idx)
                .orElseThrow(() -> new IllegalStateException("해당 상품 인덱스가 존재하지 않습니다"));
    }

}
