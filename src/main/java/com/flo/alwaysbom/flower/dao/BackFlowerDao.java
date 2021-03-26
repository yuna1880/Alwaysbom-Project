package com.flo.alwaysbom.flower.dao;

import com.flo.alwaysbom.flower.vo.FlowerVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class BackFlowerDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    public FlowerVo insertFlower(FlowerVo vo) {

        return vo;
    }

}
