package com.flo.alwaysbom.community.review.controller;

import com.flo.alwaysbom.community.review.service.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class ReviewController {
    private final ReviewService service;

    @GetMapping("/community/goReview")
    public String goReview(){
        return "community/review";
    }
}
