package com.flo.alwaysbom.member.service;

import com.flo.alwaysbom.member.dao.MemberDAO;
import com.flo.alwaysbom.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberDAO dao;

    //회원가입
    public void insertMember(MemberVO memberVO) {

        dao.insertMember(memberVO);
    }
    // 로그인
    public MemberVO login(MemberVO memberVO, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        // 등록된 아이디가 없으면
        if(dao.idCheck(memberVO.getId()) == 0) {
            out.println("<script>");
            out.println("alert('등록된 아이디가 없습니다.');");
            out.println("history.go(-1);");
            out.println("</script>");
            out.close();
            return null;
        } else {
            String pw = memberVO.getPw();
            memberVO = dao.login(memberVO.getId());
            // 비밀번호가 다를 경우
            if(!memberVO.getPw().equals(pw)) {
                out.println("<script>");
                out.println("alert('비밀번호가 다릅니다.');");
                out.println("history.go(-1);");
                out.println("</script>");
                out.close();
                return null;
            }else {
                return memberVO;
            }
        }
    }

    //로그인
    public MemberVO login(MemberVO memberVO) throws Exception {
        return dao.login(memberVO);
    }

    //로그아웃
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

    //회원 탈퇴
    public void deleteMember(MemberVO memberVO, HttpSession session) throws Exception {
        dao.deleteMember(memberVO,session);
    }

    //아이디 찾기
    public String found_id(HttpServletResponse response, String phone) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String id = dao.found_id(phone);

        if (id == null) {
            out.println("<script>");
            out.println("alert('가입된 아이디가 없습니다.');");
            out.println("history.go(-1);");
            out.println("</script>");
            out.close();
            return null;
        } else {
            return id;
        }
    }

}
