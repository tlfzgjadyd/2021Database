<%@ page import = "java.sql.*" %>
<% PreparedStatement pstmt=null; Statement stmt = null; ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
String dbUrl = "jdbc:mysql://172.30.224.1:3306/employees?useSSL=false";
Connection conn = DriverManager.getConnection(dbUrl, "root", "mysql");
try {
    pstmt=conn.prepareStatement("insert into employees.employees (emp_no, last_name, first_name) values(?, ?, ?);");
    pstmt.setInt(1,1); pstmt.setString(2, "Gi"); pstmt.setString(3, "Merin");
    pstmt.executeUpdate();
    stmt = conn.createStatement();
        if(stmt.execute("select * from employees.employees limit 10;")){
                rs=stmt.getResultSet();
        }
    out.println("<table border='1' bordercolor='#7d32a8'>");
    while(rs.next()) {
    out.println("<tr>");
    out.println("<td>");
    out.println(rs.getString("first_name"));
    out.println(rs.getString("last_name"));
    out.println("</td>");
    out.println("</tr>");
    }
    out.println("</table>");
    rs.close(); stmt.close();
     } catch(Exception e) {
      out.println("SQL exception!");
      }
      conn.close(); %>
