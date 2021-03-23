package com.flo.alwaysbom.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

    @GetMapping("/goMemberJoin")
    public String goMemberJoin() {
        return "member/join";
    }

    @GetMapping("/emailJoin")
    public String emailJoin() {
        return "member/memberJoinEmail";
    }
}