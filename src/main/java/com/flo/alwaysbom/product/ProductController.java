package com.flo.alwaysbom.product;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class ProductController {

    @GetMapping("/product")
    public String product() {
        return "/product/list";
    }

    @GetMapping("/product/detail")
    public String getOne() {
        return "/product/detail";
    }
}
