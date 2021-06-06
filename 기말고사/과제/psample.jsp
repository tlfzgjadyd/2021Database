<%@ page import = "java.sql.*" %>
<% Connection conn=null; PreparedStatement pstmt=null;
Class.forName("com.mysql.jdbc.Driver");
String dbUrl = "jdbc:mysql://172.30.32.1:3306/employees?useSSL=false";
String SQL="insert into employees (emp_no, last_name, first_name, birth_date, hire_date) values(?, ?, ?, ?, ?)";
conn = DriverManager.getConnection(dbUrl, "root", "mysql");
try {
    pstmt=conn.prepareStatement(SQL);
    pstmt.setInt(1, 1); pstmt.setString(2, "Gi"); pstmt.setString(3, "Merin");pstmt.setString(4, "1997-8-28");pstmt.setString(5, "1997-8-28");
    pstmt.executeUpdate();
    out.println("finish");
     } catch(Exception e) {
      out.println("SQL exception!");
     }
      finally{
      pstmt.close();
      conn.close();
      }%>

~                    
