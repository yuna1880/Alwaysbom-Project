package com.flo.alwaysbom.product.dao;

import com.flo.alwaysbom.product.vo.ProductVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class ProductDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    public List<ProductVo> findAll() {
        return sqlSessionTemplate.selectList("PRODUCT.findAll");
    }

    public List<ProductVo> findByCategory(String category) {
        return sqlSessionTemplate.selectList("PRODUCT.findByCategory", category);
    }

    public Optional<ProductVo> findByIdx(Integer idx) {
        return Optional.ofNullable(sqlSessionTemplate.selectOne("PRODUCT.findByIdx", idx));
    }

}
