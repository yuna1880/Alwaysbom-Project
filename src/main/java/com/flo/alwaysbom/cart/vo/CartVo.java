package com.flo.alwaysbom.cart.vo;

import com.flo.alwaysbom.choice.vo.ChoiceVo;
import com.flo.alwaysbom.flower.vo.FlowerVo;
import com.flo.alwaysbom.product.vo.ProductVo;
import com.flo.alwaysbom.subs.vo.SubsVo;
import lombok.*;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CartVo {
    private Integer idx;
    private String memberId;
    private String category;
    private Integer subsIdx;
    private Integer flowerIdx;
    private Integer productIdx;
    private int quantity;
    private String subsMonth;
    private Date subsStartDate;
    private int letter;

    // 관련 데이터
    private SubsVo subsVo;
    private FlowerVo flowerVo;
    private ProductVo productVo;
    private List<ChoiceVo> choices;
    private List<ProductVo> options;
}
