package com.flo.alwaysbom.banner.controller;

import com.flo.alwaysbom.banner.service.BannerService;
import com.flo.alwaysbom.banner.vo.BannerVo;
import com.flo.alwaysbom.util.CloudFileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class BannerController {

    private final BannerService bannerService;
    private final CloudFileHandler fileHandler;

    /* 배너 등록/수정으로 이동 */
    @GetMapping("/admin/banner/{category}")
    public String goBanner(@PathVariable String category, Model model) {
        BannerVo banner = bannerService.findByCategory(category)
                .orElseThrow(() -> new IllegalStateException("해당 카테고리의 기존 배너가 존재하지 않습니다."));
        model.addAttribute("bannerVo", banner);
        return "flower/b_banner";
    }

    /* 배너 등록 처리 */
    @PostMapping("/admin/addBanner")
    public String addBanner(BannerVo vo, MultipartFile file) throws IOException {
        vo.setImage(fileHandler.uploadFile(file, null, "banner"));
        bannerService.addBanner(vo);
        return "flower/b_flowerManager";
    }

    /* '수정완료' 버튼 눌렀을 때 처리 */
    @PostMapping("/admin/updateBanner")
    public String updateBanner(BannerVo vo, MultipartFile file) throws IOException {
        vo.setImage(fileHandler.uploadFile(file, vo.getImage(), "banner"));
        String category = bannerService.updateBanner(vo);
        return "redirect:/admin/" + category;
    }



}
