package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Bean.MyCollection;
import Utils.DBUtils;

public class CollectionDao {
	public List<MyCollection> getAllOfMy(int uid)
	 {//获得指定用户的所有收藏
		List<MyCollection> collections=new ArrayList<MyCollection>();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from MyCollection where uid=?");
			statement.setInt(1, uid);
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				MyCollection collection=new MyCollection();
				collection.setUid(rs.getInt("uid"));
				collection.setQid(rs.getInt("qid"));
				collection.setCid(rs.getInt("cid"));
				collection.setRid(rs.getInt("rid"));
				collection.setCtime(rs.getTimestamp("ctime"));
				collections.add(collection);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return collections;
	}
	public MyCollection getOneOfAll(int cid)
	 {//获得一条收藏
		MyCollection collection=new MyCollection();
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("select * from MyCollection where cid=?");
			statement.setInt(1, cid);
			ResultSet rs=statement.executeQuery();
			while(rs.next()){
				collection.setUid(rs.getInt("uid"));
				collection.setQid(rs.getInt("qid"));
				collection.setCid(rs.getInt("cid"));
				collection.setRid(rs.getInt("rid"));
				collection.setCtime(rs.getTimestamp("ctime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
		return collection;
	}
	public void addCollection(int uid,int qid,int rid)
	{
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("insert into MyCollection(uid,qid,rid) value(?,?,?)");
			statement.setInt(1, uid);
			statement.setInt(2, qid);
			statement.setInt(3, rid);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}		
	}
	public void deleteCollection(int cid)
	{
		Connection conn=DBUtils.getConnection();
		try {
			PreparedStatement statement=conn.prepareStatement("delete from MyCollection where cid=?");
			statement.setInt(1, cid);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtils.close(conn);
		}				
	}
}
