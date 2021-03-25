package com.flo.alwaysbom.fclass.dao;

import com.flo.alwaysbom.fclass.vo.FclassVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class FclassDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    public FclassVo addClass(FclassVo vo) {
        sqlSessionTemplate.insert("fclass.addClass", vo);
        return vo;
    }

    public int updateFclass(FclassVo vo) {
        System.out.println("Dao : vo = " + vo);
        sqlSessionTemplate.update("fclass.updateFclass", vo);
        return vo.getIdx();
    }
    public int deleteFclass(int idx) {
        sqlSessionTemplate.delete("fclass.deleteFclass", idx);
        return idx;
    }

    public FclassVo findByIdx(int idx) {
        return sqlSessionTemplate.selectOne("fclass.findByIdx", idx);
    }

    public List<FclassVo> findAll(){
        return sqlSessionTemplate.selectList("fclass.findAll");
    }
}
