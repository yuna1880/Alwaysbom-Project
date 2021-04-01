package com.flo.alwaysbom.coupon.service;

import com.flo.alwaysbom.coupon.dao.CouponDao;
import com.flo.alwaysbom.coupon.vo.CouponVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CouponService {

    private final CouponDao couponDao;

    public CouponVo addCoupon(CouponVo couponVo) {
        return couponDao.addCoupon(couponVo);
    }

    public List<CouponVo> findAll() {
        return couponDao.findAll();
    }
}
