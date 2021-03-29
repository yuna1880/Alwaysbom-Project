package com.flo.alwaysbom.member.dao;

import com.flo.alwaysbom.member.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private SqlSessionTemplate session;

    @Override
    public void insertMember(MemberVO memberVO) {
        session.insert("member.insertMember",memberVO);
    }
}