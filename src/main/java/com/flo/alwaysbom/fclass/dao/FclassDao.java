package com.flo.alwaysbom.fclass.dao;

import com.flo.alwaysbom.fclass.vo.FclassVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class FclassDao {

    private final SqlSessionTemplate sqlSessionTemplate;

/*    public FclassVo addClass(FclassVo vo) {

    }
    public int updateFclass(FclassVo vo) {

    }
    public int deleteFclass(int idx) {

    }*/

}
