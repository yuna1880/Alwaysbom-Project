package com.flo.alwaysbom.member;

import javax.inject.inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.flo.alwaysbom.member.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

    @Inject SqlSession sql;

    public void register(MemberVO vo) throws Exception {
        sql.insert("memberMapper.register", vo);
    }
}
