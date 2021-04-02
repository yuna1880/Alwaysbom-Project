package com.flo.alwaysbom.fclass.dao;

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

    public boolean deleteSchedule(List<Integer> idx) {
        return sqlSessionTemplate.delete("schedule.deleteSchedule", idx) > 0;
    }

    public ScheduleVo updateSchedule(ScheduleVo vo) {
        sqlSessionTemplate.update("schedule.updateSchedule", vo);
        return vo;
    }

    public ScheduleVo findByIdx(Integer scheduleIdx) {
        return sqlSessionTemplate.selectOne("schedule.findByIdx", scheduleIdx);
    }

    public List<OclassVo> findByMemberId(String id) {
        return sqlSessionTemplate.selectList("oclass.findByMemberId", id);
    }
}
