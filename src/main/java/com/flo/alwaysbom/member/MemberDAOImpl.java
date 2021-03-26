package com.flo.alwaysbom.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAOImpl implements MemberDAO{

    private final SqlSessionTemplate sessionTemplate;

    @Autowired
    public MemberDAOImpl(SqlSessionTemplate sessionTemplate) {
        this.sessionTemplate = sessionTemplate;
    }

    public void register(MemberVO vo) throws Exception {
        sessionTemplate.insert("memberMapper.register", vo);
    }
}
