package com.flo.alwaysbom.cart.controller;

import com.flo.alwaysbom.cart.service.CartService;
import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.cart.vo.Letter;
import lombok.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

    @GetMapping("/cart/list")
    public String getCart(Model model, String memberId) {
        List<CartVo> list = cartService.findCartsByMember(memberId);
        System.out.println("list = " + list);

        model.addAttribute("list", list);
        return "cart/list";
    }

    @GetMapping("/cart/order")
    public String order(@RequestBody List<CartVo> list) {
        System.out.println("list = " + list);
        for (CartVo cartVo : list) {
            System.out.println("cartVo = " + cartVo);
            System.out.println("cartVo.getLetter() = " + cartVo.getLetter());
        }
        return "";
    }
    @GetMapping("/cart/order2")
    public String order2(Integer[] idx) {
        System.out.println("idx = " + Arrays.toString(idx));
        List<CartVo> list = cartService.findByIdxArray(idx);
        System.out.println("list = " + list);

        return "";
    }

    @GetMapping("/test/letter")
    public void testLetter(Integer[] idx, String[] name, String[] content) {
        System.out.println("idx = " + Arrays.toString(idx));
        System.out.println("name = " + Arrays.toString(name));
        System.out.println("content = " + Arrays.toString(content));
    }

    @GetMapping("/test/myLetter")
    public String goLetter() {
        return "cart/letter";
    }

    @PostMapping("/test/letter2")
    @ResponseBody
    public String testLetter(ArrayList<Letter> letters, HttpServletRequest request) {
        System.out.println("CartController.testLetter");
        System.out.println("letters = " + letters);

        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            System.out.println("parameterNames.nextElement() = " + parameterNames.nextElement());
        }
        for (Letter letter : letters) {
            System.out.println("letter = " + letter);
        }

        return "hi";
    }

    @PostMapping(value = "/test/letter3")
    public String testLetter(@RequestBody List<Letter> letters, Model model) {
        System.out.println("letters = " + letters);

        for (Letter letter : letters) {
            System.out.println("letter = " + letter);
        }

        model.addAttribute("list", letters);

        return "cart/letterView";
    }


}
