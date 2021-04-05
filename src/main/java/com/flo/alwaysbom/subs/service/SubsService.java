package com.flo.alwaysbom.subs.service;


import com.flo.alwaysbom.subs.vo.SubsVo;

import java.util.List;
import java.util.Optional;

public interface SubsService {

    SubsVo addSubs(SubsVo svo);

    List<SubsVo> findAll();

    Optional<SubsVo> findByIdx(Integer idx);

}
