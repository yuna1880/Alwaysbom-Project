package com.flo.alwaysbom.coupon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CouponController {

    @GetMapping("/coupon")
    public String goCoupon() {
        return "coupon/list";
    }
}
