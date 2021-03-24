package com.flo.alwaysbom.choice.dao;

import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class ChoiceDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    public void addChoices(Integer idx, List<Integer> productIds) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("idx", idx);
        paramMap.put("productIds", productIds);

        sqlSessionTemplate.update("choice.add", paramMap);
    }
}
