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
    <title>logincheck</title>
</head>

<body>

  <% if(session.getAttribute("id") == null) {
    response.sendRedirect("login.jsp");
}%>
<%
    request.setCharacterEncoding("UTF-8");
    String url = request.getParameter("ss");
    String answer = request.getParameter("answer");
    //.substring(22);
    
    //out.print(url);
    String id = (String)session.getAttribute("id");
   // out.print(id);

    Savefile s = new Savefile();
    Date now = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddhhmmss");
    String filename = sf.format(now)+id+".png";
    Savefile.img.decodeStringtoFile(url.substring(22),"tomcat/webapps/img/"+filename);


  Class.forName("com.mysql.jdbc.Driver");
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alpacao?useUnicode=true&characterEncoding=utf-8", "alpacao", "alpaca16");
        pstmt = conn.prepareStatement("insert into imagedata (id,src,answer) values(?,?,?) ");
        pstmt.setString(1, id);
        pstmt.setString(2, filename);
        pstmt.setString(3,answer);
        pstmt.executeUpdate(); //쿼리 Excute. 실제 쿼리 실행부분

        %>
<script>
    alert("문제를 제출했어요!!!")
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
