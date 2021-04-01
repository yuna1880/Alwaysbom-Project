package com.flo.alwaysbom.product.dao;

import com.flo.alwaysbom.product.vo.ProductVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class BackProductDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    public ProductVo addProduct(ProductVo vo) {
        sqlSessionTemplate.insert("PRODUCT.addProduct", vo);
        return vo;
    }

    public List<ProductVo> findAll() {
        return sqlSessionTemplate.selectList("PRODUCT.findAll");
    }

    public List<ProductVo> findByCategory(String category) {
        return sqlSessionTemplate.selectList("PRODUCT.findByCategory", category);
    }

    public int updateProduct(ProductVo vo) {
        sqlSessionTemplate.update("PRODUCT.updateProduct", vo);
        return vo.getIdx();
    }

    public Optional<ProductVo> findByIdx(Integer idx) {
        return Optional.ofNullable(sqlSessionTemplate.selectOne("PRODUCT.findByIdx", idx));
    }

}
