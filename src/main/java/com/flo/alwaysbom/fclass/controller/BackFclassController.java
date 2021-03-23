package com.flo.alwaysbom.fclass.controller;

import com.flo.alwaysbom.fclass.service.BranchService;
import com.flo.alwaysbom.fclass.service.FclassService;
import com.flo.alwaysbom.fclass.vo.BranchVo;
import com.flo.alwaysbom.fclass.vo.FclassVo;
import com.flo.alwaysbom.util.FileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class BackFclassController {
    private final BranchService branchService;
    private final FclassService fclassService;
    private final FileHandler fileHandler;

    @GetMapping("/admin/fclass/classList")
    public String goFclassList(Model model) {
        List<FclassVo> classList = fclassService.findAll();
        List<BranchVo> branchList = branchService.findAll();
        model.addAttribute("classList", classList);
        model.addAttribute("branchList", branchList);
        return "fclass/b_classList";
    }

    @GetMapping("admin/fclass/detail")
    public String goDetail(int branchIdx, int fclassIdx ) {

        return "fclass/b_detail";
    }

    @GetMapping("admin/fclass/branch")
    public String goBranch(Model model) {
        List<BranchVo> list = branchService.findAll();
        model.addAttribute("list", list);
        return "fclass/b_branch";
    }

    @PostMapping("admin/fclass/api/addBranch")
    @ResponseBody
    public BranchVo addBranch(BranchVo vo, MultipartFile file) throws IOException {
        vo.setMapImage(fileHandler.uploadFile(file, null, "fclass/branch"));
        branchService.addBranch(vo);
        return vo;
    }
    @PostMapping("admin/fclass/api/deleteBranch")
    @ResponseBody
    public boolean deleteBranch(int idx) {
        branchService.deleteBranch(idx);
        return true;
    }
    @PostMapping("admin/fclass/api/updateBranch")
    @ResponseBody
    public BranchVo updateBranch(BranchVo vo, MultipartFile file) throws IOException {
        vo.setMapImage(fileHandler.uploadFile(file, vo.getMapImage(), "fclass/branch"));
        branchService.updateBranch(vo);
        return vo;
    }
}
