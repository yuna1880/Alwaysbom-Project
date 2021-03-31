package com.flo.alwaysbom.member.dao;

import com.flo.alwaysbom.member.vo.MemberVO;
import org.apache.ibatis.session.ResultHandler;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private SqlSessionTemplate session;
    private MemberDAO dao;

    @Override
    public void insertMember(MemberVO memberVO) {

        session.insert("member.insertMember",memberVO);
    }

    @Override
    public void loginMember(MemberVO memberVO) {

        session.select("member.loginMember", memberVO); }

    @Override
    public MemberVO memberLogin(HashMap<String, String> map) {
        return dao.memberLogin(map);
    }

    @Override
    public boolean member_id_check(String id) {
        return dao.member_id_check(id);
    }

}