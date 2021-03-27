package com.flo.alwaysbom.flower.dao;

import com.flo.alwaysbom.flower.vo.FlowerVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class BackFlowerDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    public FlowerVo addFlower(FlowerVo vo) {
        sqlSessionTemplate.insert("FLOWER.addFlower", vo);
        return vo;
    }

    public List<FlowerVo> findAll() {
        return sqlSessionTemplate.selectList("FLOWER.findAll");
    }

}
