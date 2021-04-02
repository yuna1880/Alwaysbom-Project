package com.flo.alwaysbom.fclass.service;

import com.flo.alwaysbom.fclass.dao.OclassDao;
import com.flo.alwaysbom.fclass.vo.OclassVo;
import com.flo.alwaysbom.fclass.vo.ScheduleVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OclassService {
    private final OclassDao oclassDao;

    public OclassVo addOclass(OclassVo vo) {
        return oclassDao.addOclass(vo);
    }

    public boolean deleteSchedule(List<Integer> idx) {
        if (idx == null || idx.size() == 0) {
            throw new IllegalArgumentException("idx 배열이 비어있습니다");
        }
        return oclassDao.deleteSchedule(idx);
    }

    public ScheduleVo updateSchedule(ScheduleVo vo) {
        return oclassDao.updateSchedule(vo);
    }

    public ScheduleVo findByIdx(Integer scheduleIdx) {
        return oclassDao.findByIdx(scheduleIdx);
    }

    public List<OclassVo> findByMemberId(String id) {
        return oclassDao.findByMemberId(id);
    }
}
