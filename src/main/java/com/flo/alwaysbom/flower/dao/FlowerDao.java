package com.flo.alwaysbom.flower.dao;

import com.flo.alwaysbom.flower.vo.FlowerVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class FlowerDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    public FlowerVo addFlower(FlowerVo vo) {
        sqlSessionTemplate.insert("FLOWER.addFlower", vo);
        return vo;
    }

    public List<FlowerVo> findAll() {
        return sqlSessionTemplate.selectList("FLOWER.findAll");
    }

    public Optional<FlowerVo> findByIdx(Integer idx) {
        return Optional.ofNullable(sqlSessionTemplate.selectOne("FLOWER.findByIdx", idx));
    }

    public List<FlowerVo> findRecent4() {
        return sqlSessionTemplate.selectList("FLOWER.findRecent4");
    }

    public Integer updateFlower(FlowerVo vo) {
        sqlSessionTemplate.update("FLOWER.updateFlower", vo);
        return vo.getIdx();
    }

    public void deleteFlower(Integer idx) {
        sqlSessionTemplate.update("FLOWER.deleteFlower", idx);
    }
}
