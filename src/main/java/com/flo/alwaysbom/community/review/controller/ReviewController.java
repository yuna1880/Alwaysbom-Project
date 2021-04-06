package com.flo.alwaysbom.community.review.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.flo.alwaysbom.community.review.dto.ReviewDto;
import com.flo.alwaysbom.community.review.service.ReviewService;
import com.flo.alwaysbom.community.review.vo.ReviewLikeVo;
import com.flo.alwaysbom.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class ReviewController {
    private final ReviewService service;

    @GetMapping("/community/goReview")
    public String goReview(@SessionAttribute(required = false) MemberVO member, Model model){
        if (member == null) {
            // 없을 때 임시
            member = new MemberVO();
            member.setId("ee@test.com");
        }

        List<ReviewDto> bestRList = service.allBestReview(member.getId());
        model.addAttribute("bestRList", bestRList);
        int oldListCnt = service.oldListCnt();
        model.addAttribute("oldListCnt", oldListCnt);
        List<ReviewLikeVo> likeList = service.likeList();
        model.addAttribute("likeList", likeList);
        return "community/review";
    }

    @PostMapping("/community/api/category/goAllReview")
    @ResponseBody
    public List<ReviewDto> goAllReview(@SessionAttribute(required = false) MemberVO member, Model model, String category, String startIndex, String endIndex){
        if (member == null) {
            // 없을 때 임시
            member = new MemberVO();
            member.setId("ee@test.com");
        }

        Map<String, String> searchParam = new HashMap<>();
        searchParam.put("startIndex",startIndex);
        searchParam.put("endIndex",endIndex);
        if(category.equals("")){
            category = null;
        }
        searchParam.put("category", category);

        List<ReviewDto> list = service.allCateReview(searchParam, member.getId());
        System.out.println(list);
//        ObjectMapper mapper = new ObjectMapper();
//        String jsonStr = mapper.writeValueAsString(list);
//        System.out.println(jsonStr);
        return list;

    }

    @GetMapping("/admin/question/searchReview")
    @ResponseBody
    public List<ReviewDto> searchReview(@SessionAttribute(required = false) MemberVO member, String opt, String search, Model model){
        if (member == null) {
            // 없을 때 임시
            member = new MemberVO();
            member.setId("ee@test.com");
        }

        List<ReviewDto> list = service.searchReview(opt, search, member.getId());
        System.out.println(list);
        List<ReviewLikeVo> likeList = service.likeList();
        model.addAttribute("likeList", likeList);
        return list;
    }

    @PostMapping("/community/api/category/goBestReview")
    @ResponseBody
    public List<ReviewDto> goAllReview(@SessionAttribute(required = false) MemberVO member, Model model, String tab, String category){
        if (member == null) {
            // 없을 때 임시
            member = new MemberVO();
            member.setId("ee@test.com");
        }
        System.out.println(category + " 카테 " + tab + "탭탭");
        List<ReviewDto> bestRList;
        if(category != null || !(category.equals(""))){
            model.addAttribute("category", category);
        }
        bestRList = service.cateBestReview(category, member.getId());
        model.addAttribute("bestRList", bestRList);
        List<ReviewLikeVo> likeList = service.likeList();
        model.addAttribute("likeList", likeList);
        return bestRList;
    }

    @GetMapping("/community/category/goReview")
    public String goReview(@SessionAttribute(required = false) MemberVO member, Model model, String category, Integer page){
        if (member == null) {
            // 없을 때 임시
            member = new MemberVO();
            member.setId("ee@test.com");
        }
        if(category != null || !(category.equals(""))){
            model.addAttribute("category", category);
        }
        List<ReviewDto> bestRList = service.cateBestReview(category, member.getId());
        model.addAttribute("bestRList", bestRList);
        int oldListCnt = service.oldCateListCnt(category);
        model.addAttribute("oldListCnt", oldListCnt);
        List<ReviewLikeVo> likeList = service.likeList();
        model.addAttribute("likeList", likeList);
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

    @GetMapping("/community/api/category/golike")
    public List<ReviewLikeVo> like(){

        return service.likeList();
    }

    @GetMapping("/admin/question/likeCheck")
    @ResponseBody
    public Boolean likeCheck(String memberId, Integer reviewIdx){
        service.likeCheck(memberId, reviewIdx);
        return true;
    }

}
