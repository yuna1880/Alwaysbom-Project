package com.flo.alwaysbom.fclass.dao;

import com.flo.alwaysbom.fclass.vo.ScheduleVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ScheduleDao {
    private final SqlSessionTemplate sqlSessionTemplate;

    public ScheduleVo addSchedule(ScheduleVo vo) {
        System.out.println("scheduleDao vo = " + vo);
        sqlSessionTemplate.insert("schedule.addSchedule", vo);
        System.out.println("scheduleDao after vo = " + vo);
        return vo;
    }

    public List<ScheduleVo> searchSchedule(ScheduleVo vo) {
        List<ScheduleVo> scheduleVos = sqlSessionTemplate.selectList("schedule.searchSchedule", vo);
        System.out.println("scheduleVos = " + scheduleVos);
        return scheduleVos;
    }
}
