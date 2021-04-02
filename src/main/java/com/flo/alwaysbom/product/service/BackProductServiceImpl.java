package com.flo.alwaysbom.product.service;

import com.flo.alwaysbom.product.dao.BackProductDao;
import com.flo.alwaysbom.product.vo.ProductVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BackProductServiceImpl implements BackProductService {

    private final BackProductDao dao;

    @Override
    public ProductVo addProduct(ProductVo vo) {
        return dao.addProduct(vo);
    }

    @Override
    public List<ProductVo> findByCategory(String category) {
        return dao.findByCategory(category);
    }

    @Override
    public List<ProductVo> findAll() {
        return dao.findAll();
    }

    @Override
    public int updateProduct(ProductVo vo) {
        return dao.updateProduct(vo);
    }

    @Override
    public int deleteProduct(Integer idx) {
        return dao.deleteProduct(idx);
    }

    @Override
    public Optional<ProductVo> findByIdx(Integer idx) {
        return dao.findByIdx(idx);
    }


}