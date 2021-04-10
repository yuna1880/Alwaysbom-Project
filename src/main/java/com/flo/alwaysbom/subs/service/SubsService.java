package com.flo.alwaysbom.subs.service;


import com.flo.alwaysbom.community.review.dto.ReviewDto;
import com.flo.alwaysbom.subs.vo.SubsVo;

import java.util.List;
import java.util.Optional;

public interface SubsService {

    SubsVo addSubs(SubsVo svo);

    List<SubsVo> findAll();

    Optional<SubsVo> findByIdx(Integer idx);

    Integer updateSubs(SubsVo svo);

    void deleteSubs(Integer idx);

    List<ReviewDto> findReviewByIdx(Integer idx);

    List<ReviewDto> findBestReview();
}
