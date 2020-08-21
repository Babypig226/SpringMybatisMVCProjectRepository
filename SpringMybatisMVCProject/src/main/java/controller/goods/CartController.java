package controller.goods;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.goods.GoodsCartService;
import service.goods.GoodsDelService;
import service.goods.WishlistService;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	GoodsCartService goodsCartService;
	@Autowired
	WishlistService wishlistService;
	@Autowired
	GoodsDelService goodsDelService;
	@RequestMapping("goodsCartAdd")
	public String goodsCartAdd(@RequestParam(value = "goodsNum")String goodsNum, HttpSession session, Model model) {
		goodsCartService.goodsCartAdd(goodsNum, session, model);
		return "board/delPage";		
	}
	@RequestMapping("goodsCartList")
	public String goodsCartList(HttpSession session, Model model) {
		goodsCartService.getCartList(session, model);
		return "goodsView/goodsCartList";
	}
	@RequestMapping(value = "goodsCartRemove", method = RequestMethod.POST)
	public String goodsCartRemove(@RequestParam(value = "delete")Long[] cartNums) {
		System.out.println("cartNums :"+ cartNums.length);
		goodsCartService.cartRemove(cartNums);
		return "redirect:/cart/goodsCartList";
	}
	@RequestMapping("goodsCartQtyDown")
	public String goodsCartQtyDown(@RequestParam(value = "cartNum")Long cartNum) {
		goodsCartService.goodsCartQtyDown(cartNum);
		return "redirect:/cart/goodsCartList";		
	}
	@RequestMapping("wishListAdd")
	public String wishListAdd(@RequestParam(value = "goodsNum")String goodsNum, HttpSession session, Model model) {
		wishlistService.add2Wishlist(goodsNum, session, model);
		return "board/delPage";		
	}
	@RequestMapping("wishList")
	public String wishList(Model model, HttpSession session) {
		wishlistService.getWishlist(model, session);
		return "goodsView/goodsWishList";
		
	}
	@RequestMapping("goodsDelete")
	public String goodsDelete(@RequestParam(value = "goodsNum")String goodsNum, HttpSession session) {
		goodsDelService.goodsDelete(goodsNum, session);
		return "redirect:/gd/goodsList";
		
	}

}
