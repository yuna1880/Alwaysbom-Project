package com.flo.alwaysbom.member.service;

import com.flo.alwaysbom.member.dao.MemberDAO;
import com.flo.alwaysbom.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberService{

    private final MemberDAO dao;

    public void insertMember(MemberVO memberVO) {

        dao.insertMember(memberVO);

    }

    public MemberVO login(MemberVO memberVO) throws Exception {
        return dao.login(memberVO);
    }
}

