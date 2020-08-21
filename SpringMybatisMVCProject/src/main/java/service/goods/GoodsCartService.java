package service.goods;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.AuthInfo;
import model.CartDTO;
import model.GoodsDTO;
import repository.GoodsRepository;

@Service
public class GoodsCartService {
	@Autowired
	GoodsRepository goodsRepository;
	public void goodsCartAdd(String goodsNum, HttpSession session, Model model) {
		GoodsDTO dto = new GoodsDTO();
		dto.setGoodsNum(goodsNum);
		dto = goodsRepository.getGoodsDetail(dto);
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		String[] rpsImg = dto.getGoodsImage().split("`");
		CartDTO cdto = new CartDTO();
		cdto.setGoodsNum(dto.getGoodsNum());
		cdto.setUserId(authInfo.getUserId());
		cdto.setGoodsName(dto.getGoodsName());
		cdto.setGoodsPrice(dto.getGoodsPrice());
		cdto.setGoodsImage(rpsImg[0]);
		Integer i = goodsRepository.goodsCartAdd(cdto);
		model.addAttribute("val", i);
		
		
	}
	public void getCartList(HttpSession session, Model model) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		List<CartDTO> lists = goodsRepository.getCartList(authInfo.getUserId());
		Long sumTP = 0L;
		for (CartDTO cartDTO : lists) {
			sumTP += cartDTO.getTotalPrice();
		}
		model.addAttribute("cartList", lists);
		model.addAttribute("sumTP", sumTP);
		
	}
	public void cartRemove(Long[] cartNums) {
		// to send to mybatis, array should be converted to map
		//and to use key as name in mybatis 
		List<Long> cs = new ArrayList<Long>();
		for (Long cartNum : cartNums) {
			cs.add(cartNum);
		}
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("cartNums", cs);
		goodsRepository.goodsCartRemove(condition);
		
		
	}
	public void goodsCartQtyDown(Long cartNum) {
		goodsRepository.goodsCartDown(cartNum);
		
	}

}
