package service.goods;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.AuthInfo;
import model.GoodsDTO;
import model.WishDTO;
import repository.GoodsRepository;

@Service
public class WishlistService {
	@Autowired
	GoodsRepository goodsRepository;
	public void add2Wishlist(String goodsNum, HttpSession session, Model model) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String userId = authInfo.getUserId();
		WishDTO dto = new WishDTO();
		dto.setUserId(userId);
		dto.setGoodsNum(goodsNum);
		Integer i = goodsRepository.wishAdd(dto);
		model.addAttribute("val", i);
		
		
	}
	public void getWishlist(Model model, HttpSession session) {
		String userId = ((AuthInfo)session.getAttribute("authInfo")).getUserId();		
		List<GoodsDTO> list = goodsRepository.getWishList(userId);
		model.addAttribute("wishList", list);
		
	}

}
