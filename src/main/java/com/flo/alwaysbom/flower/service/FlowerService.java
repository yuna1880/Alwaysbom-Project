package com.flo.alwaysbom.flower.service;

import com.flo.alwaysbom.flower.dao.FlowerDao;
import com.flo.alwaysbom.flower.vo.FlowerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FlowerService {

    private final FlowerDao dao;

    public List<FlowerVo> findAll() {
        return dao.findAll();
    }
}
