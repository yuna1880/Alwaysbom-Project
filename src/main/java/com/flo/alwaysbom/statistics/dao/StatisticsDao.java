package com.flo.alwaysbom.statistics.dao;

import com.flo.alwaysbom.statistics.vo.SubsByMonthVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class StatisticsDao {

    private final SqlSessionTemplate sessionTemplate;

    public List<SubsByMonthVo> findSubsByMonth() {
        return sessionTemplate.selectList("statistics.findSubsByMonth");
    }
}
