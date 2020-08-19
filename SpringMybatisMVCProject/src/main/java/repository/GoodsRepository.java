package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.GoodsDTO;

@Repository
public class GoodsRepository {
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "goodsMapper";
	public void goodsInsert(GoodsDTO dto) {
		String statement = namespace + ".goodsInsert";
		sqlSession.insert(statement, dto);
		// TODO Auto-generated method stub
		
	}
	public List<GoodsDTO> getGoodsList(GoodsDTO dto) {
		String statement = namespace + ".getGoodsList";
		return sqlSession.selectList(statement, dto);
	}
	public int getGoodsCount() {
		String statement = namespace + ".getGoodsCount";
		return sqlSession.selectOne(statement);
	}

}
