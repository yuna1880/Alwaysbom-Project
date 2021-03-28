package com.flo.alwaysbom.member.controller;

import com.flo.alwaysbom.member.service.MemberService;
import com.flo.alwaysbom.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class MemberController {

    @GetMapping("/goMemberJoin")
    public String goMemberJoin() {
        return "member/join";
    }

    @GetMapping("/member_join")
    public String member_join() {
        return "member/member_join";
    }

    @GetMapping("/memberLogin")
    public String memberLogin() {
        return "member/login";
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

    @Autowired
    private MemberService memberService;

        //SignUp GET
        @RequestMapping(value="/member_join.do", method=RequestMethod.GET)
        public void signupGET() {

        }

        //SignUp POST
        @RequestMapping(value="/member_join.do", method=RequestMethod.POST)
        public String signupPOST(MemberVO memberVO) throws Exception {

            memberService.insertMember(memberVO);

            return "/member/login";
        }
}
