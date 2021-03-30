package com.flo.alwaysbom.community.review.dao;

import com.flo.alwaysbom.community.review.dto.ReviewDto;
import com.flo.alwaysbom.community.review.vo.ReviewVo;
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

    public List<ReviewDto> allReview(String category, String tab, Map<String, Object> map) {
        List<ReviewDto> list = null;
        if(category.equals("")){
            category = null;
        }
        map.put("category", category);
        if(tab.equals("best")){
            list = sqlSessionTemplate.selectList("review.cateBestReview", category);
        } else if(tab.equals("allList")) {
            list = sqlSessionTemplate.selectList("review.allReview", map);
        }
        for (ReviewDto vo : list) {
            vo.setRegDate(vo.getRegDate().substring(0,10));
        }
        return list;
    }

    public List<ReviewDto> cateBestReview(String category) {
        List<ReviewDto> list = sqlSessionTemplate.selectList("review.cateBestReview", category);
        for (ReviewDto vo : list) {
            vo.setRegDate(vo.getRegDate().substring(0,10));
        }
        return list;
    }

    public int getTotalRecord(String category) {
        if(category.equals("")){
            category = null;
        }
        return sqlSessionTemplate.selectOne("review.totalRecord", category);
    }
}
