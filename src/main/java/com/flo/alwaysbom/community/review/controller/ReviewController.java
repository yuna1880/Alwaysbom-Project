package com.flo.alwaysbom.community.review.controller;

import com.flo.alwaysbom.community.review.service.ReviewService;
import com.flo.alwaysbom.community.review.vo.ReviewVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ReviewController {
    private final ReviewService service;

    @GetMapping("/community/goReview")
    public String goReview(Model model){
        List<ReviewVo> bestRList = service.allBestReview();
        model.addAttribute("bestRList", bestRList);
        return "community/review";
    }
}
