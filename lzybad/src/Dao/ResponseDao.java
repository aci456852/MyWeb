package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Bean.MyQuestion;
import Bean.MyResponse;
import Utils.DBUtils;

public class ResponseDao {
	public List<MyResponse> getAllOfQuestion(int qid)
	 {//获得指定问题的所有回答
		List<MyResponse> responses=new ArrayList<MyResponse>();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from MyResponse where qid=?");
			statement.setInt(1, qid);
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				MyResponse response=new MyResponse();
				response.setQid(rs.getInt("qid"));
				response.setUid(rs.getInt("uid"));
				response.setRid(rs.getInt("rid"));
				response.setRco(rs.getString("rco"));
				response.setRtime(rs.getTimestamp("rtime"));
				responses.add(response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return responses;
	}
	public List<MyResponse> getAllOfMy(int uid)
	 {//获得指定用户的所有回答
		List<MyResponse> responses=new ArrayList<MyResponse>();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from MyResponse where uid=?");
			statement.setInt(1, uid);
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				MyResponse response=new MyResponse();
				response.setQid(rs.getInt("qid"));
				response.setUid(rs.getInt("uid"));
				response.setRid(rs.getInt("rid"));
				response.setRco(rs.getString("rco"));
				response.setRtime(rs.getTimestamp("rtime"));
				responses.add(response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return responses;
	}
	public List<MyResponse> getAll()
	 {//获得所有回答
		List<MyResponse> responses=new ArrayList<MyResponse>();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from MyResponse;");
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				MyResponse response=new MyResponse();
				response.setQid(rs.getInt("qid"));
				response.setUid(rs.getInt("uid"));
				response.setRid(rs.getInt("rid"));
				response.setRco(rs.getString("rco"));
				response.setRtime(rs.getTimestamp("rtime"));
				responses.add(response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return responses;
	}
	public MyResponse getOneOfQuestion(int uid,int qid)
	 {//获得指定用户的指定问题的回答
		MyResponse response=new MyResponse();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from MyResponse where uid=? and qid=?");
			statement.setInt(1, uid);
			statement.setInt(2, qid);
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				response.setQid(rs.getInt("qid"));
				response.setUid(rs.getInt("uid"));
				response.setRid(rs.getInt("rid"));
				response.setRco(rs.getString("rco"));
				response.setRtime(rs.getTimestamp("rtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return response;
	}
	public MyResponse getOneOfResponse(int rid)
	 {//获得一条回答
		MyResponse response=new MyResponse();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from MyResponse where rid=?");
			statement.setInt(1, rid);
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				response.setQid(rs.getInt("qid"));
				response.setUid(rs.getInt("uid"));
				response.setRid(rs.getInt("rid"));
				response.setRco(rs.getString("rco"));
				response.setRtime(rs.getTimestamp("rtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return response;
	}
	
	public void addResponse(int uid,int qid,String rco)
	{
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("insert into MyResponse(uid,qid,rco) value(?,?,?)");
			statement.setInt(1, uid);
			statement.setInt(2, qid);
			statement.setString(3,rco);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}		
	}
	public void deleteResponse(int rid)
	{
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("delete from MyResponse where rid=?");
			statement.setInt(1,rid);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}			
	}
}
