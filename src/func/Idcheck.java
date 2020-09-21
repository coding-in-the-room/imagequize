package func;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Idcheck {

    String state = "";
    public String id(String idw) {


        // ID 중복확인

        String dbid = "alpacao";
        String dbpw = "alpaca16";
        String dbname = "alpacao";
        String tablename = "userinfo";
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alpacao?useUnicode=true&characterEncoding=utf-8", "alpacao", "alpaca16");
            String sql = "select count(*) as cnt from " + tablename + " where id='" + idw + "'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            rs.next();

            if (rs.getString("cnt").equals("0")) {
                state = "OK";
            } else {
                state = "NO";
            }
        } catch (Exception e) {
            System.out.println(e);
        }



        return state;
    }


}
