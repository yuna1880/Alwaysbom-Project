package com.flo.alwaysbom.fclass.service;

import com.flo.alwaysbom.fclass.dao.ScheduleDao;
import com.flo.alwaysbom.fclass.vo.ScheduleVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ScheduleService {
    private final ScheduleDao scheduleDao;

    public ScheduleVo addSchedule(ScheduleVo vo) {
        return scheduleDao.addSchedule(vo);
    }
}
