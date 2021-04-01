package com.flo.alwaysbom.order.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;
import com.flo.alwaysbom.cart.service.CartService;
import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.order.vo.Letter;
import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.order.dao.OrdersDao;
import com.flo.alwaysbom.order.service.OrdersService;
import com.flo.alwaysbom.order.vo.DeliveryInfoVo;
import com.flo.alwaysbom.order.vo.OitemVo;
import com.flo.alwaysbom.order.vo.OrdersVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequiredArgsConstructor
@SessionAttributes(value = {"orderList","oitemList"})
public class OrdersController {

    private final OrdersService ordersService;
    private final CartService cartService;
    private final OrdersDao ordersDao;

    // post 가 될 거다....
    //장바구니에 담긴 내용들 가지고 (세션에 저장) -> 편지
    @GetMapping("/order/getLetter")
    public String goLetter(Integer[] idx, Model model) {
        System.out.println("idx = " + Arrays.toString(idx));
        List<CartVo> list = cartService.findByIdxArray(idx);
        System.out.println("장바구니 list = " + list);
        model.addAttribute("orderList", list);
        return "order/letter";
    }

    //주문 시작! (받은 list oitemList 세션에 저장)
    @PostMapping("/order/letter")

    public String startOrder(String data, Model model) throws JsonProcessingException {
        System.out.println(">>startOrder() 주문시작!");

        ObjectMapper mapper = new ObjectMapper();
//        List<OitemVo> list = mapper.readValue(data, new TypeReference<List<OitemVo>>() {});
        CollectionType collectionType = mapper.getTypeFactory().constructCollectionType(ArrayList.class, OitemVo.class);
        List<OitemVo> list = mapper.readValue(data, collectionType);
        list.forEach(System.out::println);

        System.out.println("oitemList : " + list);
        model.addAttribute("oitemList", list);

        // 리스트 idx로 해당 값 꺼내는 방법!!
//        System.out.println(list.get(0).getName());
//        System.out.println(list.get(1).getName());
//        System.out.println(list.get(2).getName());

//        Iterator<OitemVo> iter = list.iterator();
//        while(iter.hasNext()){
//            System.out.println("iter.next() = " + iter.next());
//        }
        return "order/letter";
    }

    //편지 (letter_contents값 가지고)-> 배송지입력
    @PostMapping("/oitem/checkOut")
    public String checkOut(@SessionAttribute("oitemList") List<OitemVo> olist, Model model, String data) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        CollectionType collectionType = mapper.getTypeFactory().constructCollectionType(ArrayList.class, Letter.class);
        List<Letter> list = mapper.readValue(data, collectionType);

        System.out.println("oitemList : " + olist);

        for (Letter letter : list) {
            System.out.println("편지 : " + letter.getContent());
            olist.get(letter.getIdx()).setLetterContent(letter.getContent());
        }

        //변경 후
        System.out.println("oitemList : " + olist);

        // letter 모델로 보내줌 (곧 삭제)
//        model.addAttribute("letter", list);
//        System.out.println("list : " + list);

        return "order/checkout";
    }

    //배송지입력 페이지 -> 결제전 확인 페이지
    @PostMapping("/order/payment")
    public String goPayment(@SessionAttribute("oitemList") List<OitemVo> olist , OrdersVo vo, MemberVO mvo, Model model) {

        //세션값 가져오기
        System.out.println("orderVo = " + vo); //orderList
        System.out.println("OitemList = " + olist); //oitemList

        //id 임시 설정
        mvo.setId("yuna1880");
        System.out.println("MemberVo = " + mvo);

        //해당 id 회원 포인트 찾기
        int point = ordersService.getPoint(mvo);
        model.addAttribute("point",point); //포인트
        model.addAttribute("orderList", vo); //orderList 세션
        return "order/payment";
    }



    //배송지 찾기
    @PostMapping("/order/findAddress")
    @ResponseBody
    public DeliveryInfoVo findAddress(MemberVO vo) {
        System.out.println("findAddress()");
        vo.setId("yuna1880");
        System.out.println("vo : " + vo);
        DeliveryInfoVo dvo = ordersService.findAddress(vo);
        System.out.println("값 : " + dvo);
        return dvo;
    }

    //세션 예시
    @GetMapping("/order/sessionExample")
    public String sessionExample(@ModelAttribute("orderList") List<CartVo> list) {
        System.out.println("list = " + list);
        return "order/letter";
    }


}
