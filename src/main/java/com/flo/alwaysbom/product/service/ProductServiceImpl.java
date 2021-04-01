package com.flo.alwaysbom.product.service;

import com.flo.alwaysbom.product.dao.ProductDao;
import com.flo.alwaysbom.product.vo.ProductVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService{

    private final ProductDao dao;

    @Override
    public List<ProductVo> findAll() {
        return dao.findAll();
    }

    @Override
    public List<ProductVo> findByCategory(String category) {
        return dao.findByCategory(category);
    }

    @Override
    public Optional<ProductVo> findByIdx(Integer idx) {
        return dao.findByIdx(idx);
    }

}
