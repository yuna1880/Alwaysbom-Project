package com.flo.alwaysbom.community.review.controller;

import com.flo.alwaysbom.community.review.dto.ReviewDto;
import com.flo.alwaysbom.community.review.service.ReviewService;
import com.flo.alwaysbom.community.review.vo.ReviewVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ReviewController {
    private final ReviewService service;

    @GetMapping("/community/goReview")
    public String goReview(Model model){
        List<ReviewDto> bestRList = service.allBestReview();
        model.addAttribute("bestRList", bestRList);
        return "community/review";
    }

    @PostMapping("/community/api/category/goAllReview")
    @ResponseBody
    public List<ReviewDto> goAllReview(Model model, String tab, String category, Integer page){
        System.out.println(category + " 카테 " + tab + "탭탭");
        List<ReviewDto> bestRList;
        if(category != null || !(category.equals(""))){
            model.addAttribute("category", category);
        }
        bestRList = service.allReview(category, tab);
        model.addAttribute("bestRList", bestRList);
        return bestRList;
    }

    @GetMapping("/community/category/goReview")
    public String goReview(Model model, String category, Integer page){
        if(category != null || !(category.equals(""))){
            model.addAttribute("category", category);
        }
        List<ReviewDto> bestRList = service.cateBestReview(category);
        model.addAttribute("bestRList", bestRList);
        return "community/review";
    }
}
