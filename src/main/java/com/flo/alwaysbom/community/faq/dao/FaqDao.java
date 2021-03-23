package com.flo.alwaysbom.community.faq.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDao {
    private final SqlSessionTemplate sqlSessionTemplate;
}
