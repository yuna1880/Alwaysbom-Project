package com.flo.alwaysbom.product.service;

import com.flo.alwaysbom.product.vo.ProductVo;

import java.util.List;
import java.util.Optional;

public interface ProductService {

    List<ProductVo> findAll();

    List<ProductVo> findByCategory(String category);

    Optional<ProductVo> findByIdx(Integer idx);

}
