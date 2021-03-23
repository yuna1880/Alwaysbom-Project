package com.flo.alwaysbom.community.faq.dao;

import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class FaqDao {
    private final SqlSessionTemplate sqlSessionTemplate;
}
