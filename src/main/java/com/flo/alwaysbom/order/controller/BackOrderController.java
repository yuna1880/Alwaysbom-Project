package com.flo.alwaysbom.order.controller;

import com.flo.alwaysbom.order.dao.OrdersDao;
import com.flo.alwaysbom.order.service.OrdersService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class BackOrderController {

    private final OrdersService ordersService;
    private final OrdersDao ordersDao;

    @GetMapping("/admin/order")
    public String backOrder() {
        return "order/b_order";
    }
}
