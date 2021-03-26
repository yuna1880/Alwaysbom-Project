package com.flo.alwaysbom.fclass.controller;

import com.flo.alwaysbom.fclass.service.BranchService;
import com.flo.alwaysbom.fclass.service.FclassService;
import com.flo.alwaysbom.fclass.vo.BranchVo;
import com.flo.alwaysbom.fclass.vo.FclassVo;
import com.flo.alwaysbom.util.FileHandler;
import lombok.RequiredArgsConstructor;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
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
    private static final Logger logger = LoggerFactory.getLogger(BackFclassController.class);
    private ServletContext context;

    @GetMapping("/admin/fclass/addClass")
    public String goAddClass(Model model) {
        model.addAttribute("branchList", branchService.findAll());
        return "fclass/b_addClass";
    }

    @PostMapping("/admin/fclass/addClass")
    public String addClass(FclassVo vo, List<MultipartFile> file) throws IOException {
        vo.setImage1(fileHandler.uploadFile(file.get(0), null, "/fclass/class"));
        vo.setImage2(fileHandler.uploadFile(file.get(1), null, "/fclass/class"));
        vo.setImage3(fileHandler.uploadFile(file.get(2), null, "/fclass/class"));
        fclassService.addClass(vo);
        return "redirect:/admin/fclass/classList";
    }

    @PostMapping("/admin/fclass/updateClass")
    public String updateClass(FclassVo vo, Integer[] branches, List<MultipartFile> file) throws IOException {
        System.out.println("vo = " + vo);
        vo.setImage1(fileHandler.uploadFile(file.get(0), vo.getImage1(), "/fclass/class"));
        vo.setImage2(fileHandler.uploadFile(file.get(1), vo.getImage2(), "/fclass/class"));
        vo.setImage3(fileHandler.uploadFile(file.get(2), vo.getImage3(), "/fclass/class"));
        fclassService.updateFclass(vo, branches);

        return "redirect:/admin/fclass/classList";
    }

    @PostMapping("/admin/fclass/deleteClass")
    public String deleteClass(Integer idx) {
        fclassService.deleteFclass(idx);
        return "redirect:/admin/fclass/classList";
    }

    @GetMapping("/admin/fclass/classList")
    public String goFclassList(Model model) {
        List<FclassVo> classList = fclassService.findAll();
        List<BranchVo> branchList = branchService.findAll();
        model.addAttribute("classList", classList);
        model.addAttribute("branchList", branchList);
        return "fclass/b_classList";
    }

    @GetMapping("admin/fclass/detail")
    public String goDetail(Model model, int idx) {
        model.addAttribute("classInfo", fclassService.findByIdx(idx));
        model.addAttribute("branchList", branchService.findAll());
        return "fclass/b_detail";
    }


    @GetMapping("admin/fclass/branch")
    public String goBranch(Model model) {
        List<BranchVo> list = branchService.findAll();
        model.addAttribute("list", list);
        return "fclass/b_branch";
    }

    @GetMapping("admin/fclass/selectClass")
    public String goSelectClass() {
        return "fclass/b_selectClass";
    }

    @GetMapping("admin/fclass/manageSchedule")
    public String goManageSchedule(String category, Integer classIdx, Integer branchIdx, Model model) {
        model.addAttribute("category", category);
        model.addAttribute("classIdx", classIdx);
        model.addAttribute("branchIdx", branchIdx);
        return "fclass/b_manageSchedule";
    }

    @GetMapping("admin/fclass/api/findClassByCategory")
    @ResponseBody
    public List<FclassVo> findClassByCategory(String category) {
        return fclassService.findClassByCategory(category);
    }

    @GetMapping("admin/fclass/api/findBranchByClassIdx")
    @ResponseBody
    public List<BranchVo> findBranchByClassIdx(Integer classIdx) {
        return branchService.findBranchByClassIdx(classIdx);
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
