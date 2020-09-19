<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Func.Savefile" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="sun.misc.BASE64Decoder" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>reportcheck</title>
</head>

<body>


<%
    request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("userid");
    String pictureuserid = request.getParameter("pictureuserid");
    String picturenum = request.getParameter("picturenum");
    String src = request.getParameter("src");
    String reason = request.getParameter("reason");
   

    Date now = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddhhmmss");


  Class.forName("com.mysql.jdbc.Driver");
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alpacao?useUnicode=true&characterEncoding=utf-8", "alpacao", "alpaca16");
        pstmt = conn.prepareStatement("insert into illegalpicture (reporter,illegaluser,quizenum,reason,time) values(?,?,?,?,now()) ");
        pstmt.setString(1, userid);
        pstmt.setString(2, pictureuserid);
        pstmt.setString(3, picturenum);
        pstmt.setString(4,reason);
        pstmt.executeUpdate(); //쿼리 Excute. 실제 쿼리 실행부분

        %>
<script>
    alert("신고가 접수되었습니다.")
    location.href="index.jsp"
    </script>

        <%


                } catch (SQLException e) {
                    out.print(e);
                    e.printStackTrace();
                } finally {

                    if (pstmt != null)
                        try {
                            pstmt.close();
                        } catch (Exception e) {
                            out.print(e);
                        }
                    if (conn != null)
                        try {
                            conn.close();
                        } catch (Exception e) {
                            out.print(e);

                        }


                }
    %>
    
    
    </body>
    </html>
