package com.flo.alwaysbom.banner.dao;

import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class BannerDao {

    private final SqlSessionTemplate sqlSessionTemplate;


}
