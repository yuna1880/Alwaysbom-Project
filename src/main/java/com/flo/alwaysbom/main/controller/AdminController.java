package com.flo.alwaysbom.main.controller;

import com.flo.alwaysbom.fclass.service.FclassService;
import com.flo.alwaysbom.fclass.vo.FclassVo;
import com.flo.alwaysbom.main.service.MainService;
import com.flo.alwaysbom.main.vo.MainImage;
import com.flo.alwaysbom.main.vo.MainVo;
import com.flo.alwaysbom.util.FileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final MainService mainService;
    private final FclassService fclassService;
    private final FileHandler fileHandler;

    @GetMapping("/admin/main")
    public String main(Model model) {
        List<FclassVo> classes = fclassService.findAll();
        MainVo mainConfig = mainService.getConfig();
        model.addAttribute("classes", classes);
        model.addAttribute("mainConfig", mainConfig);

//        System.out.println("mainConfig = " + mainConfig);
//        System.out.println("classes = " + classes);

        return "main/b_index";
    }

//    @RequestMapping(value = "/api/admin/configs", method = RequestMethod.PUT)
    @PostMapping("/api/admin/configs")
    @ResponseBody
    public MainVo updateConfig(List<MultipartFile> image, MainVo mainVo, String[] link, String[] deleted) throws IOException {
        System.out.println("AdminController.updateConfig");
        List<MainImage> list = new ArrayList<>();
        MainVo mainConfig = mainService.getConfig();
        List<MainImage> oldImages = mainConfig.getImages();
        for (int i = 0; i < image.size(); i++) {
            MultipartFile eachImage = image.get(i);
            String eachDeleted = deleted[i];
            String eachPath = null;
            if (eachDeleted.equals("true")) {
                fileHandler.deleteFile(oldImages.get(i).getPath());
            } else {
                eachPath = fileHandler.uploadFile(eachImage, oldImages.get(i).getPath(), "/admin/main");
            }
            String eachLink = link[i];

            list.add(new MainImage(i + 1, eachPath, eachLink));
        }

        mainVo.setImages(list);
        System.out.println("mainVo = " + mainVo);

        mainService.updateConfig(mainVo);

        return mainVo;
    }
}
