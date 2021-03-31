package com.flo.alwaysbom.member.service;

import com.flo.alwaysbom.member.dao.MemberDAO;
import com.flo.alwaysbom.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberDAO dao;

    @Override
    public void insertMember(MemberVO memberVO) {

        dao.insertMember(memberVO);

    }
    @Override
    public MemberVO loginMember(MemberVO memberVO) {

        dao.loginMember(memberVO);
        return memberVO;
    }

    @Override
    public MemberVO memberLogin(HashMap<String, String> map) {
        return dao.memberLogin(map);
    }

    @Override
    public boolean member_id_check(String id) {
        return dao.member_id_check(id);
    }
}

