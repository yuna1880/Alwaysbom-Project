package com.flo.alwaysbom.coupon.controller;

import com.flo.alwaysbom.coupon.service.CouponService;
import com.flo.alwaysbom.coupon.vo.CouponVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class CouponController {

    private final CouponService couponService;

    @GetMapping("/admin/coupon")
    public String goCoupon(Model model) {
        List<CouponVo> list = couponService.findByStatus(null);
        model.addAttribute("couponList", list);
        return "coupon/list";
    }

    @GetMapping("/api/coupons")
    @ResponseBody
    public List<CouponVo> getCoupons(Integer status) {
        System.out.println("status = " + status);
        return couponService.findByStatus(status);
    }

    @PostMapping("/api/coupons")
    @ResponseBody
    public CouponVo addCoupon(@RequestBody CouponVo couponVo) {
        System.out.println("couponVo = " + couponVo);
        return couponService.addCoupon(couponVo);
    }
}
