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


    //비즈니스 로직
    public int getItemOriginalPrice() {
        int eachPrice = 0;
        if ("정기구독".equals(category)) {
            eachPrice = subsVo.getPrice();
        } else if ("꽃다발".equals(category)) {
            eachPrice = flowerVo.getPrice();
        } else if ("소품샵".equals(category)) {
            eachPrice = productVo.getPrice();
        }
        return eachPrice;
    }

    public int getItemFinalPrice() {
        int eachPrice = 0;
        if ("정기구독".equals(category)) {
            eachPrice = subsVo.getFinalPrice();
        } else if ("꽃다발".equals(category)) {
            eachPrice = flowerVo.getFinalPrice();
        } else if ("소품샵".equals(category)) {
            eachPrice = productVo.getFinalPrice();
        }
        return eachPrice;
    }

    public int getTotalPrice() {
        int eachPrice = getItemFinalPrice();

        int totalPrice = eachPrice * quantity;

        for (ChoiceVo choice : choices) {
            totalPrice += choice.getProductVo().getFinalPrice() * choice.getQuantity();
        }

        if (letter > 0) {
            totalPrice += 2500;
        }
        return totalPrice;
    }
}
