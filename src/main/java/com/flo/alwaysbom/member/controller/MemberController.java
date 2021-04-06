package com.flo.alwaysbom.member.controller;

import com.flo.alwaysbom.coupon.service.CouponService;
import com.flo.alwaysbom.coupon.vo.CouponVo;
import com.flo.alwaysbom.member.service.MemberService;
import com.flo.alwaysbom.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@SessionAttributes(value = {"member", "coupons", "couponCount"})
public class MemberController {

    private final MemberService memberService;
    private final CouponService couponService;

    @GetMapping("/goMemberJoin")
    public String goMemberJoin() {
        return "member/join";
    }

    @GetMapping("/member_join")
    public String member_join(String kakao_id, String kakao_name, String kakao_gender, Model model) {
        model.addAttribute("kakao_id", kakao_id);
        model.addAttribute("kakao_name", kakao_name);
        model.addAttribute("kakao_gender", kakao_gender);
        return "member/member_join";
    }


    //회원가입 화면 요청
    @PostMapping("/member_join")
    public String member_join(MemberVO memberVO) {
        //System.out.println("memberVO = " + memberVO);

        memberService.insertMember(memberVO);
        return "member/login";
    }

    @GetMapping("/memberLogin")
    public String memberLogin() {

        return "member/login";
    }
    //아이디 중복 확인
    @PostMapping("/CheckId")
    public String CheckId(HttpSession session) throws Exception {
        String mem_id = session.getId();
        MemberVO CheckId = memberService.CheckId(mem_id);

        if (CheckId != null) {
            return "-1";
        } else {
            return "0";
        }
    }

    @PostMapping("/loginMember")
    public String loginProc(@RequestParam String id, @RequestParam String pw, Model model) throws Exception {
        //System.out.println("아이디 : " + id + ", 패스워드 : " + pw);

        MemberVO member = new MemberVO();
        member.setId(id);
        member.setPw(pw);
        member = memberService.login(member);
        List<CouponVo> coupons = couponService.findBySearchOption(CouponVo.builder().memberId(id).build());

        model.addAttribute("coupons", coupons);
        model.addAttribute("couponCount", coupons.size());
        System.out.println("coupons = " + coupons);
        System.out.println("coupons.size() = " + coupons.size());
        model.addAttribute("member", member);
        return "redirect:/";
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session, Model model) {
        //System.out.println("before_logout_memberVO = " + model);
        //1.세션 초기화(세션 객체 종료)
        session.invalidate();
        model.addAttribute("member", null);

        //System.out.println("after_logout_memberVO = " + model);
        return "member/login";
    }

    @GetMapping("/findId")
    public String findId() {
        return "member/find_id";
    }

    @GetMapping("/foundId")
    public String foundId() {
        return "member/found_id";
    }

    @GetMapping("/findPwd")
    public String findPwd() {
        return "member/find_password";
    }

    @GetMapping("/foundPwd")
    public String foundPwd() {
        return "member/found_password";
    }

    @GetMapping("/myPage")
    public String myPage() {
        return "member/myPage";
    }

    @GetMapping("/myPage_faq_main")
    public String myPage_faq_main() {
        return "member/myPage_faq_main";
    }

    @GetMapping("/kakao_join")
    public String kakao_join() {
        return "member/kakao_join";
    }

    @GetMapping("/member_grade")
    public String member_grade() {
        return "member/member_grade";
    }

    @GetMapping("/member_update")
    public String member_update() {
        return "member/member_update";
    }

    @RequestMapping(value="/member_update", method = RequestMethod.POST)
    public String member_update(MemberVO memberVO, HttpSession session) throws Exception{

        memberService.updateMember(memberVO);

        session.invalidate();

        return "redirect:/";
    }

    @GetMapping("/mypage_review")
    public String mypage_review() {
        return "member/mypage_review";
    }

    @GetMapping("/member_point")
    public String member_point() {
        return "member/member_point";
    }

    @GetMapping("/member_delete")
    public String member_delete() {
        return "member/member_delete";
    }
}
