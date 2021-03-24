package com.flo.alwaysbom.community.review.dao;

import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ReviewDao {
    private final SqlSessionTemplate sqlSessionTemplate;
}
