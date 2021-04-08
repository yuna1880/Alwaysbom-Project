package com.flo.alwaysbom.community.review.dao;

import com.flo.alwaysbom.community.review.dto.ReviewDto;
import com.flo.alwaysbom.community.review.vo.ReviewLikeVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class ReviewDao {
    private final SqlSessionTemplate sqlSessionTemplate;

    public List<ReviewDto> allBestReview() {
        List<ReviewDto> list = sqlSessionTemplate.selectList("review.allBestReview");
        for (ReviewDto vo: list) {
            vo.setRegDate(vo.getRegDate().substring(0,10));
        }
        return list;
    }

    public List<ReviewDto> allReview(String category, String tab) {
        List<ReviewDto> list = null;
        if(category.equals("")){
            category = null;
        }
        if(tab.equals("best")){
            list = sqlSessionTemplate.selectList("review.cateBestReview", category);
        } else if(tab.equals("allList")) {
            list = sqlSessionTemplate.selectList("review.allReview", category);
        }
        for (ReviewDto vo : list) {
            vo.setRegDate(vo.getRegDate().substring(0,10));
        }
        return list;
    }

    public List<ReviewDto> cateBestReview(String category) {
        if(category.equals("")){
            category = null;
        }
        List<ReviewDto> list = sqlSessionTemplate.selectList("review.cateBestReview", category);
        for (ReviewDto vo : list) {
            vo.setRegDate(vo.getRegDate().substring(0,10));
        }
        return list;
    }

    public int oldListCnt() {
        return sqlSessionTemplate.selectOne("review.oldListCnt");
    }

    public int oldCateListCnt(String category) {
        if(category.equals("")){
            category = null;
        }
        return sqlSessionTemplate.selectOne("review.oldCateListCnt", category);
    }

    public List<ReviewDto> allCateReview(Map<String, String> searchParam) {
        List<ReviewDto> list = sqlSessionTemplate.selectList("review.allCateReview", searchParam);
        for (ReviewDto vo : list) {
            vo.setRegDate(vo.getRegDate().substring(0,10));
        }
        return list;
    }

    public List<ReviewDto> searchReview(String opt, String search) {
        List<ReviewDto> list = sqlSessionTemplate.selectList("review.searchReview", search);
        for (ReviewDto vo : list) {
            vo.setRegDate(vo.getRegDate().substring(0,10));
        }
        return list;
    }

    public void searchReview(Integer idx) {
        sqlSessionTemplate.delete("review.deleteReview", idx);
    }

    public List<ReviewLikeVo> likeList() {
        return sqlSessionTemplate.selectList("reviewLike.allLikeList");
    }

    public void likeCheck(String memberId, Integer reviewIdx) {
        List<ReviewLikeVo> list = null;
        int review=0;
        Map<String, Object> map = new HashMap<>();
        map.put("memberId", memberId);
        map.put("reviewIdx", reviewIdx);
        list = sqlSessionTemplate.selectList("reviewLike.likeSearch", map);
        if(list != null && list.size() > 0){
            sqlSessionTemplate.delete("reviewLike.likedelete" ,map);
            review = sqlSessionTemplate.selectOne("review.likeCount", reviewIdx);
            map.put("review", --review);
            sqlSessionTemplate.update("review.likeUpdate", map);
        } else{
            sqlSessionTemplate.insert("reviewLike.likeinsert", map);
            review = sqlSessionTemplate.selectOne("review.likeCount", reviewIdx);
            map.put("review", ++review);
            sqlSessionTemplate.update("review.likeUpdate", map);
        }
    }


    public boolean hasReviewLike(ReviewLikeVo reviewLikeVo) {
        int count = sqlSessionTemplate.selectOne("reviewLike.hasReview", reviewLikeVo);
        return count > 0;
    }
}
