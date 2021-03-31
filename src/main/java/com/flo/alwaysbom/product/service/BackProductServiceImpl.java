package com.flo.alwaysbom.product.service;

import com.flo.alwaysbom.product.dao.BackProductDao;
import com.flo.alwaysbom.product.vo.ProductVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BackProductServiceImpl {

    private final BackProductDao dao;

    public ProductVo addProduct(ProductVo vo) {
        return dao.addProduct(vo);
    }


}
