package com.flo.alwaysbom.community.faq.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDao {
    @Autowired
    private final SqlSessionTemplate sqlSessionTemplate;

    public FaqDao(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

}
