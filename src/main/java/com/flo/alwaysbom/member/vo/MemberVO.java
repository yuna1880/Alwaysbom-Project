package com.flo.alwaysbom.member.vo;

import lombok.*;
import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;

import java.util.Date;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO implements ResultHandler {

    private String id;
    private String pw;
    private String name;
    private Date birth;
    private String gender;
    private String phone;
    private int point;
    private String grade;

    @Override
    public void handleResult(ResultContext resultContext) {

    }
}
