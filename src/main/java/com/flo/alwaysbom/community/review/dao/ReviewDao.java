package com.flo.alwaysbom.community.review.dao;

import com.flo.alwaysbom.community.review.vo.ReviewVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ReviewDao {
    private final SqlSessionTemplate sqlSessionTemplate;

    public List<ReviewVo> allBestReview() {
        return sqlSessionTemplate.selectList("review.allBestReview");
    }
}
