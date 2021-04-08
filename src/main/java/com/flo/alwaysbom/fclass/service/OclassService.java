package com.flo.alwaysbom.fclass.service;

import com.flo.alwaysbom.fclass.dao.OclassDao;
import com.flo.alwaysbom.fclass.dao.ScheduleDao;
import com.flo.alwaysbom.fclass.vo.BranchVo;
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
    private final ScheduleDao scheduleDao;

    public OclassVo addOclass(OclassVo vo, ScheduleVo svo) {
        //해당 스케쥴 인원수 증가시켜줘야함.
        int newRegCount = svo.getRegCount() + vo.getRegCount();
        svo.setRegCount(newRegCount);
        scheduleDao.updateRegCount(svo);
        return oclassDao.addOclass(vo);
    }

    public List<OclassVo> findBySearchOption(OclassSearchOptionDto searchOption) {
        return oclassDao.findBySearchOption(searchOption);
    }

    public List<String> findAllBranch() {
        return oclassDao.findAllBranch();
    }

    public OclassVo updateOrderStatus(OclassVo oclassVo) {
        oclassDao.updateOrderStatus(oclassVo);
        return findByIdx(oclassVo.getIdx());
    }

    public OclassVo findByIdx(Integer idx) {
        return oclassDao.findByIdx(idx);
    }

    public boolean deleteOrder(Integer idx) {
        // 오더를 삭제한 후에
        OclassVo ovo = oclassDao.findByIdx(idx);
        ScheduleVo svo = scheduleDao.findByIdx(ovo.getScheduleIdx());
        int newRegCount = svo.getRegCount() - ovo.getRegCount();
        svo.setRegCount(newRegCount);
        scheduleDao.updateRegCount(svo);

        /*oclassDao.deleteOrder(idx);*/
        // 스케쥴의 레그카운트를 줄인다.

        return oclassDao.deleteOrder(idx);
    }
}
