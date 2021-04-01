package com.flo.alwaysbom.fclass.controller;

import com.flo.alwaysbom.fclass.service.BranchService;
import com.flo.alwaysbom.fclass.service.FclassService;
import com.flo.alwaysbom.fclass.service.ScheduleService;
import com.flo.alwaysbom.fclass.vo.BranchVo;
import com.flo.alwaysbom.fclass.vo.FclassVo;
import com.flo.alwaysbom.fclass.vo.OclassVo;
import com.flo.alwaysbom.fclass.vo.ScheduleVo;
import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.util.FileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class FclassController {

    private final FclassService fclassService;
    private final BranchService branchService;
    private final ScheduleService scheduleService;
    private final FileHandler fileHandler;

    @GetMapping("/fclass/classDetail")
    public String goDetail() {
        return "fclass/b_detail";
    }

    @GetMapping("/fclass/classList")
    public String goList(Model model) {
        List<FclassVo> classList = fclassService.findAll();
        List<BranchVo> branchList = branchService.findAll();
        System.out.println("classList = " + classList);
        model.addAttribute("classList", classList);
        model.addAttribute("branchList", branchList);
        return "fclass/classList";
    }

    @GetMapping("/fclass/payment")
    public String goPayment(Integer scheduleIdx, Integer regCount, Model model) {
        // member는 아마도.. 세션에서 꺼내올거야
        // 지금은 임시로 객체를 여기서 생성한다
        MemberVO memberVO = new MemberVO();
        memberVO.setId("minho1030@naver.com");
        memberVO.setPoint(1000);
        memberVO.setGrade("자스민");
        memberVO.setName("민호");
        //////////////////////////////////////////

        ScheduleVo scheduleVo = scheduleService.findByIdx(scheduleIdx);
        BranchVo branchVo = branchService.findByIdx(scheduleVo.getBranchIdx());
        FclassVo fclassVo = fclassService.findByIdx(scheduleVo.getFclassIdx());

        model.addAttribute("scheduleVo", scheduleVo);
        model.addAttribute("branchVo", branchVo);
        model.addAttribute("fclassVo", fclassVo);
        model.addAttribute("regCount", regCount);
        model.addAttribute("memberVo", memberVO);

        System.out.println("FclassController.goPayment");
        System.out.println("scheduleVo = " + scheduleVo);
        System.out.println("branchVo = " + branchVo);
        System.out.println("fclassVo = " + fclassVo);
        System.out.println("regCount = " + regCount);
        System.out.println("memberVO = " + memberVO);

        return "/fclass/m_payment";
    }

    @PostMapping ("/fclass/completePayment")
    public String completePayment(Integer scheduleIdx,String memberId, Integer discountGrade, Integer discountPoint, Integer discountTotalprice,  OclassVo ovo) {
        // @RequestParam("pay-type") String payType, Integer payTotal, String payDate, Integer discountGrade, Integer discountPoint, Model model
        System.out.println("scheduleIdx = " + scheduleIdx);
        System.out.println("memberId = " + memberId);
        System.out.println("regCount = " + ovo.getRegCount());
        System.out.println("payType = " + ovo.getPayType());
        System.out.println("payTotal = " + ovo.getPayTotal());
        System.out.println("discountGrade = " + discountGrade);
        System.out.println("discountPoint = " + discountPoint);
        System.out.println("discountTotalprice = " + discountTotalprice);
        ScheduleVo svo = scheduleService.findByIdx(scheduleIdx);
        System.out.println("fclassIdx = " + svo.getFclassIdx());
        FclassVo fvo = fclassService.findByIdx(svo.getFclassIdx());
        System.out.println("branchIdx = " + svo.getBranchIdx());
        BranchVo bvo = branchService.findByIdx(svo.getBranchIdx());
        System.out.println("branchName = " + bvo.getName());
        System.out.println("branchAddr = " + bvo.getAddr());
        System.out.println("fclassImage = " + fvo.getImage1());
        System.out.println("scheduleStartTime = " + svo.getStartTime());
        System.out.println("scheduleEndTime = " + svo.getEndTime());




        //System.out.println("regCount = " + regCount + "payType = " + payType + "payTotal = " + payTotal + "payDate = " + payDate + "discountGrade = " + discountGrade + "discountPoint = " + discountPoint);


        return "/fclass/completePayment";
    }
}
