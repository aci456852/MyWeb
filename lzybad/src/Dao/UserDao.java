package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import Bean.User;
import Utils.DBUtils;

public class UserDao 
{
	 public int isValid(String username,String password)
	 {//登录用户判断,存在返回uid
		 int valid;
		 Connection conn=DBUtils.getConnection();
		 try {
			PreparedStatement statement=conn.prepareStatement("select uid from User where username=? and password=?");
			statement.setString(1, username);
			statement.setString(2, password);
			ResultSet rs=statement.executeQuery();
			if(rs.next()){
				return rs.getInt("uid");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}
		return 0;
	 }
	 public void isRegister(String username,String password,String secondname,int age,String sex)
	 {//注册
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("insert into User(username, password,secondname,age,sex,tximg) " +
					"value(?,?,?,?,?,?)");
			statement.setString(1,username);
			statement.setString(2,password);
			statement.setString(3,secondname);
			statement.setInt(4, age);
			statement.setString(5, sex);
			Random rand = new Random();
			int x=rand.nextInt(5);
			String tx="tx"+x+".png";
			statement.setString(6,tx);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}		
	 }
	 public boolean exist(String username)
	 {//用户名是否已经存在
		boolean existed=false;
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from User where username=?");
			statement.setString(1,username);
			ResultSet rs=statement.executeQuery();
			if(rs.next()){
				existed=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}		
		return existed;
	}
	 public void personal(String secondname,String email,int age,String sex,String hobby,String motto,int uid)
	 {//个人信息修改
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("update User set secondname=?,email=?,age=?," +
					"sex=?,hobby=?,motto=? where uid=?;");
			statement.setString(1,secondname);
			statement.setString(2,email);
			statement.setInt(3, age);
			statement.setString(4, sex);
			statement.setString(5, hobby);
			statement.setString(6, motto);
			statement.setInt(7, uid);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}		
	 }
	 public List<User> getAll()
	 {//获得所有用户
		List<User> users=new ArrayList<User>();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from User;");
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				User user=new User();
				user.setUid(rs.getInt("uid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setSecondname(rs.getString("secondname"));
				user.setAge(rs.getInt("age"));
				user.setSex(rs.getString("sex"));
				user.setEmail(rs.getString("email"));
				user.setTximg(rs.getString("tximg"));
				user.setMotto(rs.getString("motto"));
				user.setHobby(rs.getString("hobby"));
				user.setUtime(rs.getTimestamp("utime"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return users;
	}
	 public User getOneOFAll(int uid)
	 {//获得一个用户
		 User user=new User();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from User where uid=?");
			statement.setInt(1, uid);
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				user.setUid(rs.getInt("uid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setSecondname(rs.getString("secondname"));
				user.setAge(rs.getInt("age"));
				user.setSex(rs.getString("sex"));
				user.setEmail(rs.getString("email"));
				user.setTximg(rs.getString("tximg"));
				user.setMotto(rs.getString("motto"));
				user.setHobby(rs.getString("hobby"));
				user.setUtime(rs.getTimestamp("utime"));
				break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return user;
	}
	 public void deleteUser(int uid)
	 {//注册
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("delete from User where uid=?");
			statement.setInt(1,uid);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}		
	 }
}
