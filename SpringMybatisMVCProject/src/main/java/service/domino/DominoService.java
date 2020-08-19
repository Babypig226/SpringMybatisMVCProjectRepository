package service.domino;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.ADTO;
import model.BDTO;
import model.CDTO;
import repository.DominoRepository;

@Service
public class DominoService {
	@Autowired
	private DominoRepository dominoRepository;
	public void execute(Model model) {
		List<ADTO> lists = dominoRepository.selectA();
		model.addAttribute("Alist", lists);
		
		
	}
	public void bTableExecute(Integer a1, Model model) {
		// TODO Auto-generated method stub
		List<BDTO> lists = dominoRepository.selectB(a1);
		model.addAttribute("Blist", lists);
		
	}
	public void cTableExecute(Integer a1, Integer b1, Model model) {
		// TODO Auto-generated method stub
		BDTO bdto = new BDTO();
		bdto.setA1(a1);
		bdto.setB1(b1);
		List<CDTO> lists = dominoRepository.selectC(bdto);
		model.addAttribute("Clist", lists);
		
	}
	

}
