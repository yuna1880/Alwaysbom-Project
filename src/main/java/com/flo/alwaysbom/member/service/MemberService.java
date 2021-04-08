package com.flo.alwaysbom.member.service;

import com.flo.alwaysbom.member.dao.MemberDAO;
import com.flo.alwaysbom.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Random;

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

    // 인증키 생성
    public String create_key() throws Exception {
        String key = "";
        Random rd = new Random();

        for (int i = 0; i < 8; i++) {
            key += rd.nextInt(10);
        }
        return key;
    }

    // 비밀번호 찾기
    public void find_pw(HttpServletResponse response, MemberVO memberVO) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        // 아이디가 없으면
        if(dao.idCheck(memberVO.getId()) == 0) {
            out.print("아이디가 없습니다.");
            out.close();
        }
        // 가입에 사용한 이메일이 아니면
        if(!memberVO.getId().equals(dao.login(memberVO.getId()))) {
            out.print("가입된 ID(이메일)이 아닙니다.");
            out.close();
        }else {
            // 임시 비밀번호 생성
            String pw = "";
            for (int i = 0; i < 12; i++) {
                pw += (char) ((Math.random() * 26) + 97);
            }
            memberVO.setPw(pw);
            // 비밀번호 변경
            dao.update_pw(memberVO);
            // 비밀번호 변경 메일 발송
            send_mail(memberVO, "find_pw");

            out.print("이메일로 임시 비밀번호를 발송하였습니다.");
            out.close();
        }
    }

    // 이메일 발송
    public void send_mail(MemberVO memberVO, String div) throws Exception {
        // Mail Server 설정
        String charSet = "utf-8"; //인코딩 설정
        String hostSMTP = "smtp.naver.com";
        String hostSMTPid = "dasom_tech@naver.com";
        String hostSMTPpwd = "tosmfqha1!";

        // 보내는 사람 EMail, 제목, 내용
        String fromEmail = "dasom_tech@naver.com";
        String fromName = "새늘봄";
        String subject = "";
        String msg = "";

        if(div.equals("find_pw")) {
            subject = "새늘봄 비밀번호 찾기 임시 비밀번호를 보내드립니다:-)";
            msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
            msg += "<h3 style='color: blue;'>";
            msg += memberVO.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
            msg += "<p>임시 비밀번호 : ";
            msg += memberVO.getPw() + "</p></div>";
        }
        // 받는 사람 E-Mail 주소
        String mail = memberVO.getId();
        try {
            HtmlEmail email = new HtmlEmail();
            email.setDebug(true);
            email.setCharset(charSet);
            email.setSSL(true);
            email.setHostName(hostSMTP);
            email.setSmtpPort(587);

            email.setAuthentication(hostSMTPid, hostSMTPpwd);
            email.setTLS(true);
            email.addTo(mail, charSet);
            email.setFrom(fromEmail, fromName, charSet);
            email.setSubject(subject);
            email.setHtmlMsg(msg);
            email.send();
        } catch (Exception e) {
            System.out.println("메일발송 실패 : " + e);
        }
    }

}
