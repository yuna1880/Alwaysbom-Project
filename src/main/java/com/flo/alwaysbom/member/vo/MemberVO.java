package com.flo.alwaysbom.member.vo;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO{

    private String id;
    private String pw;
    private String name;
    private Date birth;
    private String gender;
    private String phone;
    private int point;
    private String grade;

}
