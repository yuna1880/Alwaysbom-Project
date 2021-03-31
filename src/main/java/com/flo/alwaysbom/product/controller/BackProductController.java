package com.flo.alwaysbom.product.controller;

import com.flo.alwaysbom.product.service.BackProductServiceImpl;
import com.flo.alwaysbom.product.vo.ProductVo;
import com.flo.alwaysbom.util.FileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class BackProductController {

    private final BackProductServiceImpl backProductService;
    private final FileHandler fileHandler;

    @GetMapping("/admin/product")
    public String getIndex() {
        return "product/b_productManager";
    }

    @GetMapping("/admin/productAddForm")
    public String goInsert() {
        return "product/b_addForm";
    }

    @PostMapping("/admin/addProduct")
    public String addProduct(ProductVo vo, List<MultipartFile> file) throws IOException {
        vo.setImage1(fileHandler.uploadFile(file.get(0), null, "product"));
        vo.setImage2(fileHandler.uploadFile(file.get(1), null, "product"));
        vo.setImage3(fileHandler.uploadFile(file.get(2), null, "product"));
        System.out.println("productVo = " + vo);
        backProductService.addProduct(vo);
        return "redirect:/product";
    }
}
