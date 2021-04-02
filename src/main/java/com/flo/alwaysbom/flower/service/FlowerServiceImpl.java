package com.flo.alwaysbom.flower.service;

import com.flo.alwaysbom.flower.dao.FlowerDao;
import com.flo.alwaysbom.flower.vo.FlowerVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class FlowerServiceImpl implements FlowerService {

    private final FlowerDao dao;

    @Override
    public FlowerVo addFlower(FlowerVo vo) {
        return dao.addFlower(vo);
    }

    @Override
    public List<FlowerVo> findAll() {
        return dao.findAll();
    }

    @Override
    public Optional<FlowerVo> findByIdx(Integer idx) {
        return dao.findByIdx(idx);
    }
}
