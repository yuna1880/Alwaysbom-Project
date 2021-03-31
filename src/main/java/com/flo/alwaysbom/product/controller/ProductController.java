package com.flo.alwaysbom.product.controller;

import com.flo.alwaysbom.product.service.ProductServiceImpl;
import com.flo.alwaysbom.product.vo.ProductVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final ProductServiceImpl productService;

    @GetMapping("/product")
    public String getList(Model model) {
        List<ProductVo> findAllList = productService.findAll();
        List<ProductVo> findVaseList = productService.findByCategory("화병");
        List<ProductVo> findGoodsList = productService.findByCategory("굿즈");
        model.addAttribute("all", findAllList);
        model.addAttribute("vase", findVaseList);
        model.addAttribute("goods", findGoodsList);
        return "/product/productList";
    }

    @GetMapping("/product/{idx}")
    public String getOne(@PathVariable("idx") Integer idx, Model model) {
        ProductVo product = productService.findByIdx(idx)
                .orElseThrow(() -> new IllegalStateException("해당 상품 인덱스가 존재하지 않습니다"));
        model.addAttribute("idx", idx);
        model.addAttribute("productVo", product);
        return "product/productDetail";
    }

    @PostMapping("/product/{idx}/get")
    @ResponseBody
    public ProductVo findProductByIdx(@PathVariable("idx") Integer idx) {
        return productService.findByIdx(idx)
                .orElseThrow(() -> new IllegalStateException("해당 상품 인덱스가 존재하지 않습니다"));
    }

}
