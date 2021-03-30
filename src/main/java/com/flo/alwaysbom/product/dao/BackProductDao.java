package com.flo.alwaysbom.product.dao;

import com.flo.alwaysbom.product.vo.ProductVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class BackProductDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    public ProductVo addProduct(ProductVo vo) {
        sqlSessionTemplate.insert("PRODUCT.addProduct", vo);
        return vo;
    }


}
