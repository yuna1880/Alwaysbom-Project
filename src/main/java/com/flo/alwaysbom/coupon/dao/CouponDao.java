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

    public CouponVo addCoupon(CouponVo couponVo) {
        sessionTemplate.insert("coupon.addCoupon", couponVo);
        return couponVo;
    }

    public List<CouponVo> findAll() {
        return sessionTemplate.selectList("coupon.findAll");
    }
}
