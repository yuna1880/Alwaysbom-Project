package com.flo.alwaysbom.choice.service;

import com.flo.alwaysbom.choice.dao.ChoiceDao;
import com.flo.alwaysbom.choice.vo.ChoiceVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ChoiceServiceImpl implements ChoiceService {

    private final ChoiceDao choiceDao;

    @Override
    public void addChoices(Integer idx, List<Integer> productIds) {
        choiceDao.addChoices(idx, productIds);
    }
}
