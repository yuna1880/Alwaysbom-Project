package com.flo.alwaysbom.coupon.dao;

import com.flo.alwaysbom.coupon.vo.CouponVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class CouponDao {

    private final SqlSessionTemplate sessionTemplate;

    public void addCoupon(CouponVo couponVo) {
        sessionTemplate.insert("coupon.addCoupon", couponVo);
    }

    public List<CouponVo> findByStatus(Integer status) {
        return sessionTemplate.selectList("coupon.findByStatus", status);
    }

    public CouponVo findByIdx(Integer idx) {
        return sessionTemplate.selectOne("coupon.findByIdx", idx);
    }
}
