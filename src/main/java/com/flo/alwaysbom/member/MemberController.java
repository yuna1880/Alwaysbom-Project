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
}