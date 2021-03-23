package com.flo.alwaysbom.fclass.dao;

import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class FclassDao {

    private final SqlSessionTemplate sqlSessionTemplate;

}
