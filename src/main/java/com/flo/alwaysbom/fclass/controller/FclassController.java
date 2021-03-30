package com.flo.alwaysbom.fclass.controller;

import com.flo.alwaysbom.fclass.service.BranchService;
import com.flo.alwaysbom.fclass.service.FclassService;
import com.flo.alwaysbom.fclass.service.ScheduleService;
import com.flo.alwaysbom.fclass.vo.BranchVo;
import com.flo.alwaysbom.fclass.vo.FclassVo;
import com.flo.alwaysbom.fclass.vo.ScheduleVo;
import com.flo.alwaysbom.member.vo.MemberVO;
import com.flo.alwaysbom.util.FileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
        memberVO.setGrade("데이지");
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

        return "/fclass/payment";
    }
}
