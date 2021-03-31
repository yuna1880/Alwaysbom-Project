package com.flo.alwaysbom.community.review.vo;

import lombok.*;

@Getter
@Setter
@ToString
public class PagingVo {

    // 기본 세팅값 (변하지 않음)
    private int numPerPage = 2; //하나의 페이지에 표시할 게시글 수
    private int pagePerBlock = 1; //블록당 표시하는 페이지 갯수

    // 유동적인 필드
    private int nowPage = 1; //현재페이지, 디폴트값이 1이다.
    private int nowBlock = 1; //현재 블록(페이지 담는 단위), 디폴트값 1

    private int totalRecord = 0; //총 게시물 갯수(원본 게시글 수)
    private int totalPage = 0; //전체 페이지 갯수
    private int totalBlock = 0; //전체 블록 갯수

    private int begin = 0; //현재 페이지상의 시작 글번호 e.g) 1, 4, 7, ...
    private int end = 0; //현재 페이지상의 마지막 글번호 eg) 3, 6, 9, ...

    private int beginPage = 0; //현재 블록의 시작 페이지 번호 . 그니까 총 글의 개수가 만약 13개다-> 페이지 번호는 1부터 5까지
    private int endPage = 0; //현재 블록의 끝 페이지 번호


    // 현재 페이지와 총 게시물 개수를 파라미터로 가지는 생성자를 호출하면 모든 값이 한 번에 세팅되도록!
    public PagingVo(int nowPage, int totalRecord) {
        // nowPage
        this.nowPage = nowPage;

        // nowBlock
        nowBlock = (nowPage + pagePerBlock - 1) / pagePerBlock;

        // totalRecord
        this.totalRecord = totalRecord;

        // totalPage
        totalPage = totalRecord / numPerPage;
        if (totalRecord % numPerPage > 0) totalPage++;

        // totalBlock
        totalBlock = totalPage / pagePerBlock;
        if (totalPage % pagePerBlock > 0) totalBlock++;

        // begin
        begin = numPerPage * (nowPage - 1) + 1;

        // end
        end = begin + numPerPage - 1;

        // beginPage
        beginPage = pagePerBlock * (nowBlock - 1) + 1;

        // endPage
        endPage = beginPage + pagePerBlock - 1;
        if (endPage > totalPage) {
            endPage = totalPage;
        }
    }
}