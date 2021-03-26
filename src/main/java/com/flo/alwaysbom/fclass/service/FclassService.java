package com.flo.alwaysbom.fclass.service;

import com.flo.alwaysbom.fclass.dao.FclassDao;
import com.flo.alwaysbom.fclass.vo.FclassVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FclassService {

    private final FclassDao dao;

    public FclassVo addClass(FclassVo vo) {
        return dao.addClass(vo);
    }

    public int updateFclass(FclassVo vo, Integer[] branches) {
        return dao.updateFclass(vo, branches);
    }

    public int deleteFclass(int idx) {
        return dao.deleteFclass(idx);
    }

    public FclassVo findByIdx(int idx) {
        return dao.findByIdx(idx);
    }

    public List<FclassVo> findAll(){
        List<FclassVo> list = dao.findAll();
        return list;
    }

    public List<FclassVo> findClassByCategory(String category) {
        return dao.findClassByCategory(category);
    }
}
