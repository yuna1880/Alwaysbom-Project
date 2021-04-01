package com.flo.alwaysbom.product.service;

import com.flo.alwaysbom.product.dao.BackProductDao;
import com.flo.alwaysbom.product.vo.ProductVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BackProductServiceImpl {

    private final BackProductDao dao;

    public ProductVo addProduct(ProductVo vo) {
        return dao.addProduct(vo);
    }

    public List<ProductVo> findByCategory(String category) {
        return dao.findByCategory(category);
    }

    public List<ProductVo> findAll() {
        return dao.findAll();
    }

    public int updateProduct(ProductVo vo) {
        return dao.updateProduct(vo);
    }

    public Optional<ProductVo> findByIdx(Integer idx) {
        return dao.findByIdx(idx);
    }


}
