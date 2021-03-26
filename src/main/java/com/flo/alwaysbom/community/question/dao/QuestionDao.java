package com.flo.alwaysbom.community.question.dao;

import com.flo.alwaysbom.community.question.vo.QuestionVo;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class QuestionDao {
    private final SqlSessionTemplate sessionTemplate;
    public void addQuestion(QuestionVo vo) {
        sessionTemplate.insert("question.addque", vo);
    }
}
