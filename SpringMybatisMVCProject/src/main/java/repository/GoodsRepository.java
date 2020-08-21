package repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CartDTO;
import model.GoodsDTO;
import model.WishDTO;

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
	public GoodsDTO getGoodsDetail(GoodsDTO dto) {
		String statement = namespace + ".getGoodsList";
		return sqlSession.selectOne(statement, dto);
	}
	public int getGoodsCount() {
		String statement = namespace + ".getGoodsCount";
		return sqlSession.selectOne(statement);
	}
	public Integer goodsCartAdd(CartDTO cdto) {
		String statement = namespace + ".goodsCartAdd";
		Integer i = 0;
		try {
			i = sqlSession.insert(statement, cdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	public List<CartDTO> getCartList(String userId) {
		String statement = namespace + ".getCartList";
		return sqlSession.selectList(statement, userId);
	}
	public void goodsCartRemove(Map<String, Object> condition) {
		String statement = namespace + ".goodsCartRemove";
		sqlSession.delete(statement, condition);
		
	}
	public void goodsCartDown(Long cartNum) {
		String statement = namespace + ".goodsCartDown";
		sqlSession.update(statement, cartNum);
		
	}
	public Integer wishAdd(WishDTO dto) {
		String statement = namespace + ".wishAdd";
		sqlSession.insert(statement, dto);
		statement = namespace + ".wishCount";
		return sqlSession.selectOne(statement, dto);
	}
	public List<GoodsDTO> getWishList(String userId) {
		String statement = namespace + ".getWishList";
		return sqlSession.selectList(statement, userId);
	}
	public Integer goodsDelete(GoodsDTO dto) {
		String statement = namespace + ".goodsDelete";
		return sqlSession.delete(statement,dto);
		
	}

}
