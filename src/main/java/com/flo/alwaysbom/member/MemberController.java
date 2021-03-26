package com.flo.alwaysbom.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

    @GetMapping("/goMemberJoin")
    public String goMemberJoin() {
        return "member/join";
    }

    @GetMapping("/memberJoin")
    public String memberJoin() {
        return "member/memberJoin";
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
}