package com.flo.alwaysbom.order.service;

import com.flo.alwaysbom.order.vo.OitemVo;

import java.util.List;

public interface OitemService {

    void insertOitem (OitemVo vo);
    void deleteOitem (OitemVo vo);
    void getOitem (OitemVo vo);

    List<OitemVo> getOitemList();
    List<OitemVo> getOitemList(OitemVo vo);
}
