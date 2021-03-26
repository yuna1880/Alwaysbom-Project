package com.flo.alwaysbom.order.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OitemDao {
    private final SqlSessionTemplate sqlSessionTemplate;

    public OitemDao(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }




}
