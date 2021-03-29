package com.flo.alwaysbom.member.service;

import com.flo.alwaysbom.member.vo.MemberVO;

import java.util.HashMap;

public interface MemberService {

        //회원가입 Service
        public default void insertMember(MemberVO memberVO) throws Exception {

        }

}

