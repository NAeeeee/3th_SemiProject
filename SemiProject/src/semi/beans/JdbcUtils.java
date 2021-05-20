package semi.beans;

import java.sql.Connection;
import java.sql.DriverManager;

// 데이터베이스 관련된 유용한 작업들을 수행
public class JdbcUtils {
	
//	연결기능
//	= 테이블 종류와 무관하게 전체적으로 이용해야 하므로 객체 생성없이 쉽게 접근하도록 정적(static) 등록
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","semiadmin","semiadmin");
		return con;
	}
	
}
