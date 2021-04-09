package com.flo.alwaysbom.flower.controller;

import com.flo.alwaysbom.banner.service.BannerService;
import com.flo.alwaysbom.banner.vo.BannerVo;
import com.flo.alwaysbom.community.review.dto.ReviewDto;
import com.flo.alwaysbom.community.review.service.ReviewService;
import com.flo.alwaysbom.flower.service.FlowerService;
import com.flo.alwaysbom.flower.vo.FlowerVo;
import com.flo.alwaysbom.product.service.ProductService;
import com.flo.alwaysbom.product.vo.ProductVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class FlowerController {

    private final BannerService bannerService;
    private final FlowerService flowerService;
    private final ProductService productService;
    private final ReviewService reviewService;

    @GetMapping("/flower/test")
    public String goTest(){
        return "flower/imgThumbTest";
    }

    @GetMapping("/flower")
    public String getList(Model model) {
        BannerVo banner = bannerService.findByCategory("flower");
        List<FlowerVo> list = flowerService.findAll();
        model.addAttribute("bannerVo", banner);
        model.addAttribute("list", list);
        return "flower/flowerList";
    }

    @GetMapping("/flower/{idx}")
    public String getOne(@PathVariable("idx") Integer idx, Model model) {
        FlowerVo flower = flowerService.findByIdx(idx)
                .orElseThrow(() -> new IllegalStateException("해당 상품 인덱스가 존재하지 않습니다"));
        // 추가옵션상품 불러오기
        List<ProductVo> productList = productService.findAll();
        // 꽃다발 카테고리 베스트 리뷰 불러오기
        List<ReviewDto> bestReviewList = flowerService.findBestReview();
        // 이 상품의 리뷰 불러오기
        List<ReviewDto> thisReviewList = flowerService.findReviewByIdx(idx);

        model.addAttribute("flowerVo", flower);
        model.addAttribute("productList", productList);
        model.addAttribute("bestReviewList", bestReviewList);
        model.addAttribute("thisReviewList", thisReviewList);

        return "flower/flowerDetail";
    }

}
