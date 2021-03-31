package com.flo.alwaysbom.product.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class BackProductController {

    @GetMapping("/admin/product")
    public String getIndex() {
        return "product/b_productManager";
    }

    @GetMapping("/admin/productAddForm")
    public String goInsert() {
        return "product/b_addForm";
    }
}
