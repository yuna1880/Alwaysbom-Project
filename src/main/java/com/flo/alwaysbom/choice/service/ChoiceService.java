package com.flo.alwaysbom.choice.service;

import com.flo.alwaysbom.choice.vo.ChoiceVo;

import java.util.List;

public interface ChoiceService {

    void addChoices(Integer idx, List<Integer> productIds);
}
