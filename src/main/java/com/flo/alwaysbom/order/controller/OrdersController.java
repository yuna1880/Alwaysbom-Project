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

    //주문 시작!
    @PostMapping("/order/letter")
    public String startOrder(String data, Model model) throws JsonProcessingException {
        System.out.println(">>startOrder() 주문시작!");

        ObjectMapper mapper = new ObjectMapper();
//        List<OitemVo> list = mapper.readValue(data, new TypeReference<List<OitemVo>>() {});
        CollectionType collectionType = mapper.getTypeFactory().constructCollectionType(ArrayList.class, OitemVo.class);
        List<OitemVo> list = mapper.readValue(data, collectionType);
        list.forEach(System.out::println);
        model.addAttribute("oitemList", list);

        // 리스트 idx로 해당 값 꺼내는 방법!!
        System.out.println(list.get(0).getName());
        System.out.println(list.get(1).getName());
        System.out.println(list.get(2).getName());

        /*
        List<OitemVo> list;
        list = new ArrayList<OitemVo>();

        if (list.isEmpty()) {

            //더미값 등록 1
            OitemVo vo = new OitemVo();
            vo.setIdx(1);
            vo.setName("레몬 스프링 에디션");
            vo.setPrice(19900);
            vo.setOptions("화이트 미니도기[1],블룸 미니화병");
            vo.setImage("/static/image/oitem/0_2.png");
            vo.setRequestDate(new Date(2021, 05, 03));
            vo.setCategory("상품");
            vo.setHasLetter(true);

            //더미값 등록 2
            OitemVo vo2 = new OitemVo();
            vo2.setIdx(2);
            vo2.setName("솜사탕 로즈 에디션");
            vo2.setPrice(31300);
            vo2.setOptions("오로라 유리 화병,컨디셔닝 꽃가위");
            vo2.setImage("/static/image/oitem/0_3.png");
            vo2.setRequestDate(new Date(2021, 05, 04));
            vo2.setCategory("상품");
            vo2.setReviewCheck(0);
            vo2.setHasLetter(true);

            list.add(vo);
            list.add(vo2);

            model.addAttribute("oitemList", list);
            System.out.println("받은 리스트 : " + list);
        }

        */
        return "order/letter";
    }

    //편지 (letter_contents값 가지고)-> 배송지입력
    @PostMapping("/oitem/checkOut")
    public String checkOut(Model model, String data) throws JsonProcessingException {

        ObjectMapper mapper = new ObjectMapper();
        List<Letter> list = mapper.readValue(data,List.class);

        // letter 모델로 보내줌
        model.addAttribute("letter", list);
        System.out.println("list : " + list);

        return "order/checkout";
    }


    //배송지입력 페이지 -> 결제전 확인 페이지
    @PostMapping("/order/payment")
    public String goPayment(@ModelAttribute("oitemList") OitemVo ovo , @ModelAttribute("orderList") OrdersVo vo, MemberVO mvo, Model model) {

        //세션값 가져오기
        System.out.println("orderVo = " + vo);
        System.out.println("OitemVo = " + ovo);

        //id 임시 설정
        mvo.setId("yuna1880");

        //vo, ovo 셋팅
        System.out.println("MemberVo = " + mvo);

        //해당 id 회원 포인트 찾기
        int point = ordersService.getPoint(mvo);
        model.addAttribute("point",point);
        model.addAttribute("vo", vo);
        model.addAttribute("ovo", vo);
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
