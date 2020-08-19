package command;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsCommand {
	String goodsNum;
	String goodsName;
	Long goodsPrice;
	String goodsContent;
	MultipartFile[] goodsImage;

}
