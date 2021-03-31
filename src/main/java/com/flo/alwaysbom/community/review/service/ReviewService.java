package com.flo.alwaysbom.community.review.service;

import com.flo.alwaysbom.community.review.dao.ReviewDao;
import com.flo.alwaysbom.community.review.dto.ReviewDto;
import com.flo.alwaysbom.community.review.vo.ReviewVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ReviewService {
    private final ReviewDao reviewDao;

    public List<ReviewDto> allBestReview() {
        return reviewDao.allBestReview();
    }

    public List<ReviewDto> allReview(String category, String tab, Map<String, Object> map) {
        return reviewDao.allReview(category, tab, map);
    }

    public List<ReviewDto> cateBestReview(String category) {
        return reviewDao.cateBestReview(category);
    }

    public int getTotalReclrd(String category) {
        return reviewDao.getTotalRecord(category);
    }
}
