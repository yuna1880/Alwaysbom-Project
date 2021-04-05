package com.flo.alwaysbom.community.review.service;

import com.flo.alwaysbom.community.review.dao.ReviewDao;
import com.flo.alwaysbom.community.review.dto.ReviewDto;
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

    public List<ReviewDto> allReview(String category, String tab) {
        return reviewDao.allReview(category, tab);
    }

    public List<ReviewDto> cateBestReview(String category) {
        return reviewDao.cateBestReview(category);
    }

    public int oldListCnt() {
        return reviewDao.oldListCnt();
    }

    public int oldCateListCnt(String category) {
        return reviewDao.oldCateListCnt(category);
    }

    public List<ReviewDto> allCateReview(Map<String, String> searchParam) {
        return reviewDao.allCateReview(searchParam);
    }

    public List<ReviewDto> searchReview(String opt, String search) {
        return reviewDao.searchReview(opt, search);
    }

    public void deleteReview(Integer idx) {
        reviewDao.searchReview(idx);
    }
}
