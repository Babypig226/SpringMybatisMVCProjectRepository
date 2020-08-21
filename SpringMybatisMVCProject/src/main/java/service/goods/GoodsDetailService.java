package service.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.GoodsDTO;
import repository.GoodsRepository;

@Service
public class GoodsDetailService {
	@Autowired
	GoodsRepository goodsRepository;

	public void getGoodsDetail(String goodsNum, Model model) {
		// TODO Auto-generated method stub
		GoodsDTO dto = new GoodsDTO();
		dto.setGoodsNum(goodsNum);
		dto = goodsRepository.getGoodsDetail(dto);
		model.addAttribute("list", dto);
		
	}

}
