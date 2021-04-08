package com.flo.alwaysbom.community.review.service;

import com.flo.alwaysbom.community.review.dao.ReviewDao;
import com.flo.alwaysbom.community.review.dto.ReviewDto;
import com.flo.alwaysbom.community.review.vo.ReviewLikeVo;
import com.flo.alwaysbom.order.dao.OrdersDao;
import com.flo.alwaysbom.order.vo.OitemVo;
import com.flo.alwaysbom.order.vo.OrdersSearchOptionDto;
import com.flo.alwaysbom.order.vo.OrdersVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ReviewService {
    private final ReviewDao reviewDao;
    private final OrdersDao ordersDao;

    public List<ReviewDto> allBestReview(String memberId) {
        List<ReviewDto> reviews = reviewDao.allBestReview();
        for (ReviewDto review : reviews) {
            ReviewLikeVo reviewLikeVo = new ReviewLikeVo(null, review.getIdx(), memberId);
            review.setHasReview(reviewDao.hasReviewLike(reviewLikeVo));
        }
        return reviews;
    }

    public List<ReviewDto> allReview(String category, String tab, Integer idx) {
        return reviewDao.allReview(category, tab, idx);
    }

    public List<ReviewDto> cateBestReview(String category, String memberId) {
        List<ReviewDto> reviews = reviewDao.cateBestReview(category);
        for (ReviewDto review : reviews) {
            ReviewLikeVo reviewLikeVo = new ReviewLikeVo(null, review.getIdx(), memberId);
            review.setHasReview(reviewDao.hasReviewLike(reviewLikeVo));
        }
        return reviews;
    }

    public int oldListCnt() {
        return reviewDao.oldListCnt();
    }

    public int oldCateListCnt(String category) {
        return reviewDao.oldCateListCnt(category);
    }

    public List<ReviewDto> allCateReview(Map<String, String> searchParam, String memberId) {
        List<ReviewDto> reviews = reviewDao.allCateReview(searchParam);
        for (ReviewDto review : reviews) {
            ReviewLikeVo reviewLikeVo = new ReviewLikeVo(null, review.getIdx(), memberId);
            review.setHasReview(reviewDao.hasReviewLike(reviewLikeVo));
        }
        return reviews;
    }

    public List<ReviewDto> searchReview(String opt, String search, String memberId) {
        List<ReviewDto> reviews = reviewDao.searchReview(opt, search);
        for (ReviewDto review : reviews) {
            ReviewLikeVo reviewLikeVo = new ReviewLikeVo(null, review.getIdx(), memberId);
            review.setHasReview(reviewDao.hasReviewLike(reviewLikeVo));
        }
        return reviews;
    }

    public void deleteReview(Integer idx) {
        reviewDao.searchReview(idx);
    }

    public List<ReviewLikeVo> likeList() {
        return reviewDao.likeList();
    }

    public void likeCheck(String memberId, Integer reviewIdx) {
        reviewDao.likeCheck(memberId, reviewIdx);
    }

    //마이페이지 order 가져오기
    public List<OrdersVo> reviewPossible(String id) {
        return reviewDao.findByStatus(id);
    }

}
