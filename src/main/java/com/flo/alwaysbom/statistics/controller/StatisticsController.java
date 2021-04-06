package com.flo.alwaysbom.statistics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StatisticsController {

    @GetMapping("/admin/statistics/subs")
    public String goStatistics() {
        return "statistics/subs";
    }
}
