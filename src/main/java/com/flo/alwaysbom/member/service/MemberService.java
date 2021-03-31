package com.flo.alwaysbom.member.service;

import com.flo.alwaysbom.member.vo.MemberVO;

import java.util.HashMap;

public interface MemberService {

        //회원가입 Service
        public void insertMember(MemberVO memberVO);

        //회원 로그인 Service
        public MemberVO loginMember(MemberVO memberVO);

        MemberVO memberLogin(HashMap<String, String> map);

        boolean member_id_check(String id);
}

