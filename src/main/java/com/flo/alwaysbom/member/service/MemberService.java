package com.flo.alwaysbom.member.service;

import com.flo.alwaysbom.member.dao.MemberDAO;
import com.flo.alwaysbom.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberDAO dao;

    public void insertMember(MemberVO memberVO) {

        dao.insertMember(memberVO);
    }

    public MemberVO login(MemberVO memberVO) throws Exception {
        return dao.login(memberVO);
    }

    public void logout(HttpSession session, Model model) {
        session.invalidate();
        model.addAttribute("member", null);

    }

    //아이디 중복 확인
    public int idCheck(String id) {
        int cnt= dao.idCheck(id);
        return cnt;
    }

    //회원 정보 수정
    public void updateMember(MemberVO memberVO) throws Exception {
        dao.updateMember(memberVO);

    }
}
