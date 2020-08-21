package service.goods;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.AuthInfo;
import model.GoodsDTO;
import repository.GoodsRepository;

@Service
public class GoodsDelService {
	@Autowired
	GoodsRepository goodsRepository;
	public void goodsDelete(String goodsNum, HttpSession session) {
		GoodsDTO dto = new GoodsDTO();
		dto.setUserId(((AuthInfo)session.getAttribute("authInfo")).getUserId());
		dto.setGoodsNum(goodsNum);
		dto = goodsRepository.getGoodsDetail(dto);		
		Integer i = goodsRepository.goodsDelete(dto);
			if(i >= 1) {
				String path = "/WEB-INF/view/goodsView/upload";
				String realPath = session.getServletContext().getRealPath(path);
				File file = null;
				String[] files = dto.getGoodsImage().split("`");
				for (String string : files) {
					file = new File(realPath+"/"+string);
					if(file.exists()) {
						System.out.println("file:"+file);
						file.delete();
					}
				}
			}
		
		
	}
	

}
