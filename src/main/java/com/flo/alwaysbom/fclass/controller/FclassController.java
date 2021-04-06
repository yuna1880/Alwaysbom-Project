package com.flo.alwaysbom.fclass.controller;

import com.flo.alwaysbom.fclass.service.BranchService;
import com.flo.alwaysbom.fclass.service.FclassService;
import com.flo.alwaysbom.fclass.service.OclassService;
import com.flo.alwaysbom.fclass.service.ScheduleService;
import com.flo.alwaysbom.fclass.vo.*;
import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.util.FileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class FclassController {

    private final FclassService fclassService;
    private final BranchService branchService;
    private final ScheduleService scheduleService;
    private final FileHandler fileHandler;
    private final OclassService oclassService;

    @GetMapping("/fclass/orders")
    public String goMyClassList(@SessionAttribute(required = false) MemberVO member, Model model) {
        OclassSearchOptionDto searchOption = new OclassSearchOptionDto();
        searchOption.setMemberId(member != null ? member.getId() : "minho1030@naver.com");

        List<OclassVo> orders = oclassService.findBySearchOption(searchOption);
        model.addAttribute("orders", orders);
        return "fclass/myClassList";
    }

    @GetMapping("/api/fclass/orders")
    public String getOrders(@SessionAttribute(required = false) MemberVO member, Model model, OclassSearchOptionDto searchOption) {
        searchOption.setMemberId(member != null ? member.getId() : "minho1030@naver.com");
        List<OclassVo> orders = oclassService.findBySearchOption(searchOption);
        model.addAttribute("orders", orders);
        return "fclass/myClassListContent";
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

    @GetMapping("/fclass/classList/{idx}")
    public String classDetail(@PathVariable("idx") Integer idx, Model model) {
        FclassVo fclassVo = fclassService.findByIdx(idx);
        List<BranchVo> branchList = fclassVo.getBranchList();

        model.addAttribute("fclassVo", fclassVo);
        model.addAttribute("branchList", branchList);
        return "fclass/flowerClassDetail";
        //return "fclass/detail_temp";
    }

    @GetMapping("/fclass/payment")
    public String goPayment(Integer scheduleIdx, Integer regCount, Model model) {
        // member는 아마도.. 세션에서 꺼내올거야
        // 지금은 임시로 객체를 여기서 생성한다
        MemberVO memberVO = new MemberVO();
        memberVO.setId("dlagksk64@naver.com");
        memberVO.setPoint(2000);
        memberVO.setGrade("자스민");
        memberVO.setName("임하나");
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
        System.out.println("branchList = " + branchVo);
        System.out.println("fclassVo = " + fclassVo);
        System.out.println("regCount = " + regCount);
        System.out.println("memberVO = " + memberVO);

        return "/fclass/payment";
    }

    @PostMapping ("/fclass/completePayment")
    public String completePayment(Integer scheduleIdx, OclassVo ovo, Model model) {
        // @RequestParam("pay-type") String payType, Integer payTotal, String payDate, Integer discountGrade, Integer discountPoint, Model model
        System.out.println("ovo = " + ovo);

        System.out.println("scheduleIdx = " + scheduleIdx);
        ScheduleVo svo = scheduleService.findByIdx(scheduleIdx);

        System.out.println("fclassIdx = " + svo.getFclassIdx());
        FclassVo fvo = fclassService.findByIdx(svo.getFclassIdx());

        System.out.println("branchIdx = " + svo.getBranchIdx());
        BranchVo bvo = branchService.findByIdx(svo.getBranchIdx());

        System.out.println("svo = " + svo);
        System.out.println("fvo = " + fvo);
        System.out.println("bvo = " + bvo);

        ovo.setFclassName(fvo.getName());
        ovo.setBranchName(bvo.getName());
        ovo.setBranchAddr(bvo.getAddr());
        ovo.setFclassImage(fvo.getImage1());
        ovo.setScheduleDate(svo.getSdate());
        ovo.setScheduleStartTime(svo.getStartTime());
        ovo.setScheduleEndTime(svo.getEndTime());
        ovo.setFclassCount(fvo.getCount());
        if (ovo.getPayType().equals("무통장입금")) {
            ovo.setStatus("입금대기");
        } else {
            ovo.setStatus("결제완료");
        }
        ovo.setFclassIdx(fvo.getIdx());
        ovo.setScheduleIdx(svo.getIdx());
        oclassService.addOclass(ovo, svo);

        if(svo.getTotalCount() < svo.getRegCount() + ovo.getRegCount() ) {
            throw new IllegalStateException("등록 인원수가 큽니다");
        }
/*        if (!ovo.getPayType().equals("무통장입금")) {
            svo.setRegCount(svo.getRegCount() + ovo.getRegCount());
        }*/

        scheduleService.updateSchedule(svo);

        model.addAttribute("order", ovo);

        MemberVO member = new MemberVO();
        member.setName("임하나");
        model.addAttribute("member", member);

        return "/fclass/completePayment";
    }

    @GetMapping("/api/fclass/schedules/{idx}")
    @ResponseBody
    public ScheduleVo getSchedule(@PathVariable Integer idx) {
        return scheduleService.findByIdx(idx);
    }

}
