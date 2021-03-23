package com.flo.alwaysbom.community.faq.controller;

import com.flo.alwaysbom.community.faq.service.FaqService;
import com.flo.alwaysbom.community.faq.vo.FaqVo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class FaqController {
    private final FaqService service;

    @GetMapping("goFaq")
    public String goFaq(FaqVo vo, Model model) {
        List<String> cateList = service.faqCategory();
        model.addAttribute("category", cateList);
        return "community/faq";
    }

    @PostMapping("gogoFaq")
    public List<FaqVo> gogoFaq(FaqVo vo, String category){
        System.out.println(vo.getCategory() + "가지나?" + category);
        List<FaqVo> faqlist = service.faqlist(vo);
        for (FaqVo vo1 : faqlist) {
            System.out.println(vo1.getCategory()+ "dddddddddddddddddddddddddddd");
        }
        return faqlist;
    }
}