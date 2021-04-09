package com.flo.alwaysbom.product.controller;

import com.flo.alwaysbom.banner.service.BannerService;
import com.flo.alwaysbom.banner.vo.BannerVo;
import com.flo.alwaysbom.community.review.dto.ReviewDto;
import com.flo.alwaysbom.community.review.service.ReviewService;
import com.flo.alwaysbom.product.service.ProductService;
import com.flo.alwaysbom.product.vo.ProductVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final BannerService bannerService;
    private final ProductService productService;
    private final ReviewService reviewService;

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
        // 소품샵 카테고리 베스트 리뷰 불러오기
        List<ReviewDto> bestReviewList = reviewService.allReview("소품샵", "best", idx);
        // 이 상품의 리뷰 불러오기
        List<ReviewDto> thisReviewList = reviewService.allReview("소품샵", "allList", idx);
        model.addAttribute("idx", idx);
        model.addAttribute("productVo", product);
        model.addAttribute("bestReviewList", bestReviewList);
        model.addAttribute("thisReviewList", thisReviewList);

        return "product/productDetail";
    }

    @PostMapping("/product/{idx}/get")
    @ResponseBody
    public ProductVo findProductByIdx(@PathVariable("idx") Integer idx) {
        return productService.findByIdx(idx)
                .orElseThrow(() -> new IllegalStateException("해당 상품 인덱스가 존재하지 않습니다"));
    }

}
