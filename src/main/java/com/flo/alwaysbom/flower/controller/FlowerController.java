package com.flo.alwaysbom.flower.controller;

import com.flo.alwaysbom.flower.service.FlowerService;
import com.flo.alwaysbom.flower.service.FlowerServiceImpl;
import com.flo.alwaysbom.flower.vo.FlowerVo;
import com.flo.alwaysbom.product.controller.ProductController;
import com.flo.alwaysbom.product.service.ProductService;
import com.flo.alwaysbom.product.service.ProductServiceImpl;
import com.flo.alwaysbom.product.vo.ProductVo;
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

    private final FlowerService flowerService;
    private final ProductServiceImpl productService;

    @GetMapping("/flower/test")
    public String goTest(){
        return "flower/imgThumbTest";
    }

    @GetMapping("/flower")
    public String getList(Model model) {
        List<FlowerVo> list = flowerService.findAll();
        model.addAttribute("list", list);
        return "flower/flowerList";
    }

    @GetMapping("/flower/{idx}")
    public String getOne(@PathVariable("idx") Integer idx, Model model) {
        FlowerVo flower = flowerService.findByIdx(idx)
                .orElseThrow(() -> new IllegalStateException("해당 상품 인덱스가 존재하지 않습니다"));
        List<ProductVo> productList = productService.findAll();
        model.addAttribute("flowerVo", flower);
        model.addAttribute("productList", productList);
        return "flower/flowerDetail";
    }

//    @GetMapping("/flower/{idx}/get")
//    @ResponseBody
//    public FlowerVo findFlowerByIdx(@PathVariable("idx") Integer idx) {
//        return flowerService.findByIdx(idx)
//                .orElseThrow(() -> new IllegalStateException("해당 상품 인덱스가 존재하지 않습니다"));
//    }

}
