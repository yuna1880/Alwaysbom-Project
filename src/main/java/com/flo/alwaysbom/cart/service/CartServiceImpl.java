package com.flo.alwaysbom.cart.service;

import com.flo.alwaysbom.cart.dao.CartDao;
import com.flo.alwaysbom.cart.vo.CartVo;
import com.flo.alwaysbom.choice.service.ChoiceService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class CartServiceImpl implements CartService {

    private final ChoiceService choiceService;
    private final CartDao cartDao;

    @Override
    public List<CartVo> findAllCarts() {
        List<CartVo> allCarts = cartDao.findAllCarts();

        System.out.println("allCarts = " + allCarts);
        return allCarts;
    }

    @Override
    public Integer addCart(CartVo cartVo, Integer[] productIds) {
        System.out.println("productIds = " + productIds);
        cartDao.addCart(cartVo);
        System.out.println("cartVo = " + cartVo);
        choiceService.addChoices(cartVo.getIdx(), productIds);
        return cartVo.getIdx();
    }

    @Override
    public List<CartVo> findCartsByMember(String memberId) {
        return cartDao.findCartsByMember(memberId);
    }
}
