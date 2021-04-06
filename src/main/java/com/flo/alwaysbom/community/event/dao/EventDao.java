package com.flo.alwaysbom.community.event.dao;

import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
@RequiredArgsConstructor
public class EventDao {
    private final SqlSessionTemplate sqlSessionTemplate;


}
