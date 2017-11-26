package shopBeans;
import java.sql.*;

public class ConnDB
{
	public Connection conn=null;
	public Statement stmt=null;
	public ResultSet rs=null;
	private static final String dbDriver="com.mysql.jdbc.Driver";
	private static final String dbUrl="jdbc:mysql://localhost:3306/ecommerce";
	private static final String dbUser="root";
	private static final String dbPwd="admin";

	
	public static Connection getConnection()
	{
		Connection conn=null;
		try
		{
			Class.forName(dbDriver);
			conn=DriverManager.getConnection(dbUrl,dbUser,dbPwd);
                        System.out.println("ok"+conn.toString());
		}
		catch(Exception e)
		{
                    
			e.printStackTrace();
		}
    	if (conn == null) 
    	{
      		System.err.println("connect");
    	}		
		return conn;
	}

	public ResultSet doQuery(String sql)
	{
		try
		{
			conn=ConnDB.getConnection();
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(sql);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return rs;
	}
	//�������
	public int doUpdate(String sql)
	{
		int result=0;
		try
		{
			conn=ConnDB.getConnection();
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			//stmt=conn.createStatement();
                       
                        result=stmt.executeUpdate(sql);
                        System.out.println("Successfully Deleted data");

		}
		catch(SQLException e)
		{
                    e.printStackTrace();
			result=0;
		}
		return result;
	}
 
	public void closeConnection()
	{
		try
		{
			if (rs!=null)
				rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			if (stmt!=null)
				stmt.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			if (conn!=null)
				conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
        

    public static void main(String[] arg) throws Exception {
        ConnDB.getConnection();
    }
	
}