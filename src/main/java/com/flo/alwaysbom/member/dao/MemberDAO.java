package com.flo.alwaysbom.member.dao;

import com.flo.alwaysbom.member.vo.MemberVO;

import java.util.HashMap;

public interface MemberDAO {
    //회원가입 DAO
    public void insertMember(MemberVO memberVO);

    //회원 로그인 DAO
    public void loginMember(MemberVO memberVO);

    MemberVO memberLogin(HashMap<String, String> map);

    boolean member_id_check(String id);
}



