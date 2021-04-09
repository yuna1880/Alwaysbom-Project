package com.flo.alwaysbom.banner.service;

import com.flo.alwaysbom.banner.vo.BannerVo;
import com.flo.alwaysbom.cart.vo.CartVo;

import java.util.Optional;

public interface BannerService {

    BannerVo addBanner(BannerVo bannerVo);

    Optional<BannerVo> findByCategory(String category);

    String updateBanner(BannerVo vo);

    String deleteFlower(String category);
}
