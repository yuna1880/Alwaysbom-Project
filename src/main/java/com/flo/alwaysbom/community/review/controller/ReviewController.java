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

    @PostMapping("/community/api/category/goReview")
    @ResponseBody
    public String goReview(Model model, String category, Integer page){
        System.out.println(category+ "제발 나와주세요");
        return "";
    }

    @PostMapping("/community/api/category/goAllReview")
    @ResponseBody
    public List<ReviewDto> goAllReview(Model model, String category, Integer page){
        List<ReviewDto> bestRList;
        System.out.println(category + "제발 나와주세요");
//        if(category == null || category.equals("")){
            bestRList = service.allReview(category);
            model.addAttribute("bestRList", bestRList);
//        }
        return bestRList;
    }
}
