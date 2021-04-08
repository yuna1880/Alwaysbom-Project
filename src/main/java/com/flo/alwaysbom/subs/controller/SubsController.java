package com.flo.alwaysbom.subs.controller;

import com.flo.alwaysbom.product.service.ProductServiceImpl;
import com.flo.alwaysbom.product.vo.ProductVo;
import com.flo.alwaysbom.subs.service.SubsService;
import com.flo.alwaysbom.subs.vo.SubsVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class SubsController {

    private final SubsService subsService;
    private final ProductServiceImpl productService;

    @GetMapping("/subs")
    public String goIndex(Model model) {
        List<SubsVo> list = subsService.findAll();
        model.addAttribute("subsList", list);
        return "subs/subsMain";
    }

    @GetMapping("/subs/{idx}")
    public String getOne(@PathVariable("idx") Integer idx, Model model) {
        System.out.printf("idx : " + idx);
        SubsVo subs = subsService.findByIdx(idx)
                .orElseThrow( () -> new IllegalStateException("해당 상품 인덱스가 존재하지 않습니다"));
        System.out.println("subs : " + subs);
        List<ProductVo> productList = productService.findAll();
        model.addAttribute("subsVo",subs);
        model.addAttribute("productList", productList);
        return "subs/subsDetail";
    }
}
