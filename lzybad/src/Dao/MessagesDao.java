package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Bean.Messages;
import Utils.DBUtils;

public class MessagesDao {
	public List<Messages> getAll()
	 {//获得所有留言
		List<Messages> messages=new ArrayList<Messages>();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from Messages");
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				Messages message=new Messages();
				message.setUid(rs.getInt("uid"));
				message.setMid(rs.getInt("mid"));
				message.setMco(rs.getString("mco"));
				message.setMtime(rs.getTimestamp("mtime"));
				messages.add(message);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return messages;
	}
	public void addMessages(int uid,String mco)
	{
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("insert into Messages(uid,mco) value(?,?)");
			statement.setInt(1, uid);
			statement.setString(2, mco);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}		
	}
	public void deleteMessages(int mid)
	{
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("delete from Messages where mid=?");
			statement.setInt(1, mid);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
	}
}
