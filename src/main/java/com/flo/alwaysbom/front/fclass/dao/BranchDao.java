package com.flo.alwaysbom.front.fclass.dao;

import com.flo.alwaysbom.front.fclass.vo.BranchVo;
import com.flo.alwaysbom.front.fclass.vo.FclassVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class BranchDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    public BranchVo addBranch(BranchVo vo){
        sqlSessionTemplate.insert("branch.addBranch", vo);
        return vo;
    }
    public int updateBranch(BranchVo vo){
        return sqlSessionTemplate.update("branch.updateBranch", vo);
    }
    public int deleteBranch(int idx){
        sqlSessionTemplate.delete("branch.deleteBranch", idx);
        return idx;
    }
    public BranchVo findByIdx(int idx){
        return sqlSessionTemplate.selectOne("branch.findByIdx", idx);
    }
    public List<BranchVo> findAll(){
        return sqlSessionTemplate.selectList("branch.findAll");
    }
}