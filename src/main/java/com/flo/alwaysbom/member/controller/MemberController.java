package com.flo.alwaysbom.member.controller;

import com.flo.alwaysbom.coupon.service.CouponService;
import com.flo.alwaysbom.coupon.vo.CouponVo;
import com.flo.alwaysbom.member.service.MemberService;
import com.flo.alwaysbom.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@SessionAttributes(value = {"member", "coupons", "couponCount"})
public class MemberController {

    private final MemberService memberService;
    private final CouponService couponService;

    //회원가입하기 누르면 가입 옵션 나오는 페이지
    @GetMapping("/goMemberJoin")
    public String goMemberJoin() {
        return "member/join";
    }

    //회원가입(get)
    @GetMapping("/member_join")
    public String member_join(String kakao_id, String kakao_name, String kakao_gender, Model model) {
        model.addAttribute("kakao_id", kakao_id);
        model.addAttribute("kakao_name", kakao_name);
        model.addAttribute("kakao_gender", kakao_gender);
        return "member/member_join";
    }

    //회원가입 화면 요청(post)
    @PostMapping("/member_join")
    public String member_join(MemberVO memberVO) {
        //System.out.println("memberVO = " + memberVO);
        memberService.insertMember(memberVO);
        return "member/login";
    }

    //로그인(get)
    @GetMapping("/login")
    public String memberLogin() {
        return "member/login";
    }

    //아이디 중복 확인
    @GetMapping("/idCheck")
    public @ResponseBody int idCheck(@RequestParam("id")String id) {
        int cnt=memberService.idCheck(id);
        return cnt;
    }

    //로그인(post)
    @PostMapping("/login")
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

    //로그아웃
    @RequestMapping("/logout")
    public String logout(HttpSession session, Model model) {
        //System.out.println("before_logout_memberVO = " + model);
        //1.세션 초기화(세션 객체 종료)
        session.invalidate();
        model.addAttribute("member", null);

        //System.out.println("after_logout_memberVO = " + model);
        return "member/login";
    }

    //아이디 찾기
    @RequestMapping(value = "/find_id")
    public String find_id() throws Exception {
        return "member/find_id";
    }

    //아이디 찾기
    @RequestMapping(value = "/found_id", method = RequestMethod.POST)
    public String found_id(HttpServletResponse response, @RequestParam("phone") String phone, Model model) throws Exception{
        model.addAttribute("id", memberService.found_id(response, phone));
        return "/member/found_id";
    }
    // 비밀번호 찾기 폼
    @RequestMapping(value = "/find_pw")
    public String find_pw() throws Exception{
        return "/member/find_pw";
    }

    // 비밀번호 찾기
    @RequestMapping(value = "/found_pw", method = RequestMethod.POST)
    public void found_pw(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws Exception{
        memberService.find_pw(response, memberVO);
    }



//    //비밀번호 찾기
//    @GetMapping("/findPwd")
//    public String findPwd() {
//        return "member/find_password";
//    }

//    //찾은 비밀번호
//    @GetMapping("/foundPwd")
//    public String foundPwd() {
//        return "member/found_password";
//    }


    //마이페이지 메인
    @GetMapping("/myPage")
    public String myPage() {
        return "member/myPage";
    }

    //1:1문의
    @GetMapping("/myPage_faq_main")
    public String myPage_faq_main() {
        return "member/myPage_faq_main";
    }

    //카카오 회원가입
    @GetMapping("/kakao_join")
    public String kakao_join() {
        return "member/kakao_join";
    }

    //회원 등급
    @GetMapping("/member_grade")
    public String member_grade() {
        return "member/member_grade";
    }

    //회원 정보 수정(get)
    @GetMapping("/member_update")
    public String member_update() {
        return "member/member_update";
    }

    //회원정보수정(post)
    @RequestMapping(value="/member_update", method = RequestMethod.POST)
    public String member_update(MemberVO memberVO, HttpSession session) throws Exception{
        memberService.updateMember(memberVO);
        session.invalidate();
        return "redirect:/";
    }

    //상품 후기
    @GetMapping("/mypage_review")
    public String mypage_review() {
        return "member/mypage_review";
    }

    //포인트
    @GetMapping("/member_point")
    public String member_point() {
        return "member/member_point";
    }

    //회원 탈퇴(get)
    @GetMapping("/member_delete")
    public String member_delete() {
        return "member/member_delete";
    }

    //회원 탈퇴(post)
    @RequestMapping(value="/member_delete", method = RequestMethod.POST)
    public String member_delete(MemberVO memberVO, Model model, HttpSession session) throws Exception{
        memberService.deleteMember(memberVO, session);
        model.addAttribute("member", null);
        return "redirect:/";
    }

}
