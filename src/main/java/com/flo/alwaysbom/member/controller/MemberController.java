package com.flo.alwaysbom.member.controller;

import com.flo.alwaysbom.member.service.MemberService;
import com.flo.alwaysbom.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class MemberController {

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

    @Autowired
    private MemberService memberService;

    @GetMapping("/memberLogin")
    public String memberLogin(String id, String pw, HttpSession session) {
        //화면에서 입력한 아이디와 비밀번호가 일치하는 회원 정보가 DB에 있는지 확인하여
        HashMap<String, String> map = new HashMap<String, String>();

        map.put("id", id);
        map.put("pw", pw);
        MemberVO vo = memberService.memberLogin(map);

        //일치하는 회원 정보가 있다면 회원 정보를 세션에 담는다
        session.setAttribute("login_info", vo);

        return "member/login";
    }

    @GetMapping("/id_check")
    public boolean id_check(String id) {
        return memberService.member_id_check(id);
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

//        //SignUp GET
//        @RequestMapping(value="/member_join.do", method=RequestMethod.GET)
//        public void signupGET() {
//
//        }
//
//        //SignUp POST
//        @RequestMapping(value="/member_join.do", method=RequestMethod.POST)
//            public String signupPOST(MemberVO memberVO) throws Exception {
//
//                memberService.insertMember(memberVO);
//
//            return "/member/login";
//        }

    //회원가입 화면 요청
    @PostMapping("/member_join")
    public String member_join() {
        MemberVO memberVO = new MemberVO();
        memberService.insertMember(memberVO);

        return "member/login";
}
}
