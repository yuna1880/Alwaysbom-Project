package com.flo.alwaysbom.statistics.controller;

import com.flo.alwaysbom.statistics.service.StatisticsService;
import com.flo.alwaysbom.statistics.vo.SubsByMonthVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class StatisticsController {

    private final StatisticsService statisticsService;

    @GetMapping("/admin/statistics/subs")
    public String goStatistics() {
        return "statistics/subs";
    }

    @GetMapping("/statistics/api/subsByMonth")
    @ResponseBody
    public List<SubsByMonthVo> getSubsByMonth() {
        System.out.println("StatisticsController.getSubsByMonth");
        return statisticsService.findSubsByMonth();
    }
}
