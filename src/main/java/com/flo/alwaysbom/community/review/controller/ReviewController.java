package com.flo.alwaysbom.community.review.controller;

import com.flo.alwaysbom.community.review.dto.ReviewDto;
import com.flo.alwaysbom.community.review.service.ReviewService;
import com.flo.alwaysbom.community.review.vo.PagingVo;
import com.flo.alwaysbom.community.review.vo.ReviewVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        Map<String, Object> map = new HashMap<>();
        System.out.println(category + " 카테 " + tab + "탭탭" + page);
        List<ReviewDto> bestRList;
        int totalRecord;

        if(category != null || !(category.equals(""))){
            model.addAttribute("category", category);
        }
        if(tab.equals("allList")){
            totalRecord = service.getTotalReclrd(category);
            System.out.println(totalRecord + "총 개시문 개수");
            PagingVo pvo = new PagingVo(1, totalRecord);
            if(page != null) {
                pvo = new PagingVo(page, totalRecord);
            }
            map.put("begin", pvo.getBegin());
            map.put("end", pvo.getEnd());
            model.addAttribute("totalRecord", totalRecord);
            model.addAttribute("pvo", pvo);
        }
        bestRList = service.allReview(category, tab, map);
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
