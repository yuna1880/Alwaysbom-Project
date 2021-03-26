package com.flo.alwaysbom.member;

import com.flo.alwaysbom.member.MemberVO;

public interface MemberDAO {

    //회원가입
    public void register(MemberVO vo) throws Exception;
}
