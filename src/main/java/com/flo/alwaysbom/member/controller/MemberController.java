package com.flo.alwaysbom.member.controller;

import com.flo.alwaysbom.member.service.MemberService;
import com.flo.alwaysbom.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Member;

@Controller
@RequiredArgsConstructor
@SessionAttributes(value = "member")
public class MemberController {

    private final MemberService memberService;

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

        memberService.insertMember(memberVO);
        return "member/login";
    }

    @GetMapping("/memberLogin")
    public String memberLogin() {
        return "member/login";
    }

    @PostMapping("/loginMember")
    public String loginProc(@RequestParam String id, @RequestParam String pw, Model model){
        System.out.println("아이디 : " + id + ", 패스워드 : " + pw);

        MemberVO member = new MemberVO();
        member.setId(id);
        member.setPw(pw);

        model.addAttribute("member", member);

        return "main/index";
    }

    @GetMapping("/findId")
    public String findId() {
        return "member/findId";
    }

    @GetMapping("/foundId")
    public String foundId() {
        return "member/foundId";
    }

    @GetMapping("/findPwd")
    public String findPwd() {
        return "member/findPassword";
    }

    @GetMapping("/foundPwd")
    public String foundPwd() {
        return "member/foundPassword";
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
}
