package com.flo.alwaysbom.order.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.cart.vo.Letter;
import com.flo.alwaysbom.order.service.OitemService;
import com.flo.alwaysbom.order.vo.OitemVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class OitemController {

    private final OitemService oitemService;

    //편지 (letter_contents값 가지고)-> 배송지입력
    @PostMapping("/oitem/checkOut")
    public String checkOut(Model model, String data) throws JsonProcessingException {

        ObjectMapper mapper = new ObjectMapper();
        List<Letter> list = mapper.readValue(data,List.class);
        model.addAttribute("letter",list);
        System.out.println("list : " + list);

        return "order/checkout";
    }
}
