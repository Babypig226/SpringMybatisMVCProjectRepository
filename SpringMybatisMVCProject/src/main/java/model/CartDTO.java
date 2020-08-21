package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDTO {
	Long cartNum;
	String goodsNum;
	String userId;
	String goodsName;
	Long goodsPrice;
	String goodsImage;
	Long qty;
	Long totalPrice;
	

}
