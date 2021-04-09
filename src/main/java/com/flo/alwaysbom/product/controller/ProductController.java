package com.flo.alwaysbom.product.controller;

import com.flo.alwaysbom.banner.service.BannerService;
import com.flo.alwaysbom.banner.vo.BannerVo;
import com.flo.alwaysbom.product.service.ProductService;
import com.flo.alwaysbom.product.vo.ProductVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final BannerService bannerService;
    private final ProductService productService;

    @GetMapping("/product")
    public String getList(Model model) {
        BackProductController.getProductList(model, productService.findAll(), productService.findByCategory("vase"),
                productService.findByCategory("goods"));
        BannerVo banner = bannerService.findByCategory("product");
        model.addAttribute("bannerVo", banner);
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
