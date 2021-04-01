package com.flo.alwaysbom.member.dao;

import com.flo.alwaysbom.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class MemberDAO{

    private final SqlSessionTemplate sessionTemplate;

    public void insertMember(MemberVO memberVO) {

        sessionTemplate.insert("member.insertMember",memberVO);
    }

    public MemberVO login(MemberVO memberVO) throws Exception {
        return sessionTemplate.selectOne("Member.Login", memberVO);
    }


}