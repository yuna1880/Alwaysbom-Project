package com.flo.alwaysbom.product.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class BackProductController {

    @GetMapping("/admin/product")
    public String getIndex() {
        return "b_productManager";
    }

    @GetMapping("/admin/productInsert")
    public String goInsert() {
        return "b_addForm";
    }
}
