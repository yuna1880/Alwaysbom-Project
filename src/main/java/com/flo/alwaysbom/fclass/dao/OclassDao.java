package com.flo.alwaysbom.fclass.dao;

import com.flo.alwaysbom.fclass.vo.BranchVo;
import com.flo.alwaysbom.fclass.vo.OclassSearchOptionDto;
import com.flo.alwaysbom.fclass.vo.OclassVo;
import com.flo.alwaysbom.fclass.vo.ScheduleVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class OclassDao {
    private final SqlSessionTemplate sqlSessionTemplate;

    public OclassVo addOclass(OclassVo vo) {
        sqlSessionTemplate.insert("oclass.addOclass", vo);
        return vo;
    }

    public List<OclassVo> findBySearchOption(OclassSearchOptionDto searchOption) {
        System.out.println("searchOption = " + searchOption);
        return sqlSessionTemplate.selectList("oclass.findBySearchOption", searchOption);
    }

    public List<String> findAllBranch() {
        return sqlSessionTemplate.selectList("oclass.findAllBranch");
    }
}
