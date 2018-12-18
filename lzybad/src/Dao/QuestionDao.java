package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Bean.MyQuestion;
import Utils.DBUtils;

public class QuestionDao {
	public List<MyQuestion> getAll()
	 {//获得所有问题
		List<MyQuestion> questions=new ArrayList<MyQuestion>();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from MyQuestion;");
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				MyQuestion question=new MyQuestion();
				question.setQid(rs.getInt("qid"));
				question.setUid(rs.getInt("uid"));
				question.setQtitle(rs.getString("qtitle"));
				question.setQco(rs.getString("qco"));
				question.setQtime(rs.getTimestamp("qtime"));
				questions.add(question);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return questions;
	}
	public List<MyQuestion> getFireQues(int uid)
	 {//按照热度排序
		int o=0;
		HashMap<Integer,Integer> hm=new HashMap<Integer,Integer>(); 
		List<MyQuestion> questions=new ArrayList<MyQuestion>();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement state=conn.prepareStatement("select qid from MyResponse");
			ResultSet r=state.executeQuery();
			while(r.next()){
				int textqid=r.getInt("qid");
				hm.put(textqid, hm.containsKey(textqid) ? hm.get(textqid) + 1 : 1);
			}
			List<Map.Entry<Integer, Integer>> infoIds = new ArrayList<Map.Entry<Integer, Integer>>(hm.entrySet());  
			Collections.sort(infoIds, new Comparator<Map.Entry<Integer, Integer>>() {  
		            public int compare(Map.Entry<Integer, Integer> o1,Map.Entry<Integer, Integer> o2) {  
		                return (o1.getValue()).toString().compareTo(o2.getValue().toString());  
		            }  
		        });  
			for(Map.Entry<Integer,Integer> en: infoIds)
			{
				int key = en.getKey();
				PreparedStatement statement=conn.prepareStatement("select * from MyQuestion where qid=?;");
				statement.setInt(1, key);
				ResultSet rs=statement.executeQuery();
				while(rs.next()){
					MyQuestion question=new MyQuestion();
					question.setQid(rs.getInt("qid"));
					question.setUid(rs.getInt("uid"));
					question.setQtitle(rs.getString("qtitle"));
					question.setQco(rs.getString("qco"));
					question.setQtime(rs.getTimestamp("qtime"));
					questions.add(question);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}	
		return questions;
	}
	public List<MyQuestion> getAllOfMy(int uid)
	 {//获得指定用户的所有问题--我的问题
		List<MyQuestion> questions=new ArrayList<MyQuestion>();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from MyQuestion where uid=?;");
			statement.setInt(1, uid);
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				MyQuestion question=new MyQuestion();
				question.setQid(rs.getInt("qid"));
				question.setUid(rs.getInt("uid"));
				question.setQtitle(rs.getString("qtitle"));
				question.setQco(rs.getString("qco"));
				question.setQtime(rs.getTimestamp("qtime"));
				questions.add(question);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return questions;
	}
	public List<MyQuestion> getAllOfHobby(int uid)
	 {//获得首页用户感兴趣的问题--首页模糊查询
		List<MyQuestion> questions=new ArrayList<MyQuestion>();
		String hobby="";
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select hobby from User where uid=?");
			statement.setInt(1, uid);
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				hobby=rs.getString("hobby");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}		
		if(hobby==null)
			hobby="";
		conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from MyQuestion where qtitle like '%"+hobby+"%'");
			//statement.setString(1, hobby);
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				MyQuestion question=new MyQuestion();
				question.setQid(rs.getInt("qid"));
				question.setUid(rs.getInt("uid"));
				question.setQtitle(rs.getString("qtitle"));
				question.setQco(rs.getString("qco"));
				question.setQtime(rs.getTimestamp("qtime"));
				questions.add(question);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return questions;
	}
	public List<MyQuestion> getfind(String hobby)
	 {//搜索框模糊查询
		List<MyQuestion> questions=new ArrayList<MyQuestion>();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from MyQuestion where qtitle like '%"+hobby+"%'");
			//statement.setString(1, hobby);
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				MyQuestion question=new MyQuestion();
				question.setQid(rs.getInt("qid"));
				question.setUid(rs.getInt("uid"));
				question.setQtitle(rs.getString("qtitle"));
				question.setQco(rs.getString("qco"));
				question.setQtime(rs.getTimestamp("qtime"));
				questions.add(question);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return questions;
	}
	public MyQuestion getOneOfAll(int qid)
	 {//获得指定问题
		MyQuestion question=new MyQuestion();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from MyQuestion where qid=?;");
			statement.setInt(1, qid);
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				question.setQid(rs.getInt("qid"));
				question.setUid(rs.getInt("uid"));
				question.setQtitle(rs.getString("qtitle"));
				question.setQco(rs.getString("qco"));
				question.setQtime(rs.getTimestamp("qtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return question;
	}
	public MyQuestion getOneOfMy(int uid,int qid)
	 {//获得指定用户的指定问题
		MyQuestion question=new MyQuestion();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from MyQuestion where uid=? and qid=?;");
			statement.setInt(1, uid);
			statement.setInt(2, qid);
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				question.setQid(rs.getInt("qid"));
				question.setUid(rs.getInt("uid"));
				question.setQtitle(rs.getString("qtitle"));
				question.setQco(rs.getString("qco"));
				question.setQtime(rs.getTimestamp("qtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return question;
	}
	
	public void addQuestion(int uid,String qtitle,String qco)
	{//增加问题
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("insert into MyQuestion(uid,qtitle,qco) value(?,?,?)");
			statement.setInt(1, uid);
			statement.setString(2,qtitle);
			statement.setString(3,qco);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}		
	}
	public void deleteQuestion(int qid)
	{//删除问题
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("delete from MyQuestion where qid=?");
			statement.setInt(1,qid);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}			
	}
}
