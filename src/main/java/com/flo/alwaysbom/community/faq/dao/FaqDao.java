package com.flo.alwaysbom.community.faq.dao;

import com.flo.alwaysbom.community.faq.vo.FaqVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class FaqDao {
    private final SqlSessionTemplate sqlSessionTemplate;

    public List<String> faqCategoryStrings() {
        return sqlSessionTemplate.selectList("faq.faqCategoryStrings");
    }

    public List<FaqVo> faqList(FaqVo vo) {
        return sqlSessionTemplate.selectList("faq.faqlist", vo);
    }
}
