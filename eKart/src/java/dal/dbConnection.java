package dal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
public class dbConnection {
    static Connection con = null;
   static public Connection makeCon() {
        try {
            String url = "jdbc:mysql://localhost:3306/";
            String dbName = "ecommerce";
            String driver = "com.mysql.jdbc.Driver";
            String userName = "root";
            String password = "admin";
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(url + dbName, userName, password);
            // con.close();
        } catch (Exception e) {
           System.out.println(e.toString());



        } finally {
            //  out.close();
        }

        return con;
    }
public static int getCommentValue(String sql) {
		Connection c=null;
                int balance=0;
		try {
			c = makeCon();
			Statement st = c.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				balance = rs.getInt(1);
			}
                        closeConnection(c);
		}
		catch (Exception ex) {
			System.out.println (ex);
		}
		
		return balance;
	}
    static public void closeConnection(Connection con) {
        try {
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
