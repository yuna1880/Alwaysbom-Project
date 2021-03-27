package com.flo.alwaysbom.cart.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.flo.alwaysbom.cart.service.CartService;
import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.cart.vo.Letter;
import lombok.*;
import org.springframework.http.codec.json.Jackson2JsonDecoder;
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

    //폼으로 이동
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

    // 이 폼
    // <form action="/test/letterForm" method="post">
    // <input type='text' name='data' value='[{"idx":1,"name":"폴인로즈 에디션","content":"아무거나입력한것"}]'>
    // </form>

    @PostMapping("/test/letterForm")
    public String letterForm(String data, Model model) throws JsonProcessingException {
        //json문자열을 mapper라는 것을 이용해서 문자열에 있는 값과 필드의 값을 매칭해주는 것. = mapping / 하는 애는 mapper.
        ObjectMapper mapper = new ObjectMapper();
        //mapper.readValue 문자열을 읽어서 data의 문자열을 List형태로 매칭시켜라... (변환할 대상 , 어떤타입으로 변환할건지 명시)
        //Object List 바꾼 뒤 Letter리스트로 강제 변환..!
        List<Letter> list = mapper.readValue(data, List.class);
        //model 담아서 넣어주기.
        model.addAttribute("list", list);
        return "cart/letterView";
    }

    //@RequestBody : 들어오는 json 문자열을 java객체로 변환.
    //@ResponseBody : 리턴되는 자바 객체를 json문자열로 변환.
}
