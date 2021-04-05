package com.flo.alwaysbom.community.review.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.flo.alwaysbom.community.review.dto.ReviewDto;
import com.flo.alwaysbom.community.review.service.ReviewService;
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
        int oldListCnt = service.oldListCnt();
        model.addAttribute("oldListCnt", oldListCnt);

        return "community/review";
    }

    @PostMapping("/community/api/category/goAllReview")
    @ResponseBody
    public List<ReviewDto> goAllReview(Model model, String category, String startIndex, String endIndex) throws JsonProcessingException {
        Map<String, String> searchParam = new HashMap<>();
        searchParam.put("startIndex",startIndex);
        searchParam.put("endIndex",endIndex);
        if(category.equals("")){
            category = null;
        }
        searchParam.put("category", category);

        List<ReviewDto> list = service.allCateReview(searchParam);
        System.out.println(list);
//        ObjectMapper mapper = new ObjectMapper();
//        String jsonStr = mapper.writeValueAsString(list);
//        System.out.println(jsonStr);
        return list;

    }

    @GetMapping("/admin/question/searchReview")
    @ResponseBody
    public List<ReviewDto> searchReview(String opt, String search, Model model){
        List<ReviewDto> list = service.searchReview(opt, search);
        System.out.println(list);
        return list;
    }

    @PostMapping("/community/api/category/goBestReview")
    @ResponseBody
    public List<ReviewDto> goAllReview(Model model, String tab, String category){
        System.out.println(category + " 카테 " + tab + "탭탭");
        List<ReviewDto> bestRList;
        if(category != null || !(category.equals(""))){
            model.addAttribute("category", category);
        }
        bestRList = service.cateBestReview(category);
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
        int oldListCnt = service.oldCateListCnt(category);
        model.addAttribute("oldListCnt", oldListCnt);
        return "community/review";
    }

    @GetMapping("/community/category/writeReview")
    public String goWrite(){
        return null;
    }

    @GetMapping("/community/category/deleteReview")
    public String deleteReview(Integer idx){
        service.deleteReview(idx);
        return "redirect:/community/goReview";
    }
}
