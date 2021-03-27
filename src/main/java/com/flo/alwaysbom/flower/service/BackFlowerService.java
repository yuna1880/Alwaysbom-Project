package com.flo.alwaysbom.flower.service;

import com.flo.alwaysbom.flower.dao.BackFlowerDao;
import com.flo.alwaysbom.flower.vo.FlowerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BackFlowerService {

    private final BackFlowerDao dao;

    public FlowerVo addFlower(FlowerVo vo) {
        return dao.addFlower(vo);
    }

    public List<FlowerVo> findAll() {
        System.out.println("BackFlowerService.findAll() 실행");
        return dao.findAll();
    }
}
