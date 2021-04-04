package com.flo.alwaysbom.fclass.service;

import com.flo.alwaysbom.fclass.dao.OclassDao;
import com.flo.alwaysbom.fclass.vo.OclassSearchOptionDto;
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

    public List<OclassVo> findBySearchOption(OclassSearchOptionDto searchOption) {
        return oclassDao.findBySearchOption(searchOption);
    }
}
