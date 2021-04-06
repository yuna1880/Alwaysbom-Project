package com.flo.alwaysbom.subs.dao;

import com.flo.alwaysbom.subs.vo.SubsVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class SubsDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    public SubsVo addSubs(SubsVo svo) {
        sqlSessionTemplate.insert("SUBS.addSubs",svo);
        return svo;
    }

    public List<SubsVo> findAll() {
        return sqlSessionTemplate.selectList("SUBS.findAll");
    }

    public Optional<SubsVo> findByIdx(Integer idx) {
        return Optional.ofNullable(sqlSessionTemplate.selectOne("SUBS.findByIdx",idx));
    }
    public Integer updateSubs(SubsVo svo) {
        sqlSessionTemplate.update("SUBS.updateSubs",svo);
        return svo.getIdx();
    }
}
