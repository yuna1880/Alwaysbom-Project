package com.flo.alwaysbom.member.dao;

import com.flo.alwaysbom.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

@Repository
@RequiredArgsConstructor
public class MemberDAO{

    private final SqlSessionTemplate sessionTemplate;

    //회원 가입
    public void insertMember(MemberVO memberVO) {

        sessionTemplate.insert("member.insertMember",memberVO);
    }

    //로그인
    public MemberVO login(MemberVO memberVO) throws Exception {
        return sessionTemplate.selectOne("member.Login", memberVO);
    }

    //로그아웃
    public void logout(HttpSession session){

    }

    // 아이디 중복 확인
    public int idCheck(String id) {
        int cnt=sessionTemplate.selectOne("member.idCheck", id);
        return cnt;
    }

    // 휴대폰번호 중복 확인
    public int phoneCheck(String phone) {
        int cnt=sessionTemplate.selectOne("member.phoneCheck", phone);
        return cnt;
    }

    //회원 정보 수정
    public void updateMember(MemberVO memberVO) throws Exception {
        sessionTemplate.update("member.updateMember", memberVO);
    }

    //회원 탈퇴
    public void deleteMember(MemberVO memberVO, HttpSession session) throws Exception {
        sessionTemplate.delete("member.deleteMember", memberVO);
        session.invalidate();
    }

}