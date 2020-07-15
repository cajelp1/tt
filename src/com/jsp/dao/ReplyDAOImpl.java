package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jsp.dto.ReplyVO;
import com.jsp.request.SearchCriteria;

public class ReplyDAOImpl implements ReplyDAO{
	
	
	private SqlSessionFactory sessionFactory;
	public void setSessionFactory(SqlSessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	@Override
	public void insertReply(ReplyVO reply) throws SQLException {
		SqlSession session = sessionFactory.openSession(true);
		session.update("Reply-Mapper.insertReply",reply);
		session.close();
		
	}
	@Override
	public void updateReply(ReplyVO reply) throws SQLException {
		SqlSession session = sessionFactory.openSession(true);
		session.update("Reply-Mapper.updateReply",reply);
		session.close();
		
	}
	@Override
	public void deleteReply(int rno) throws SQLException {
		SqlSession session = sessionFactory.openSession(true);
		session.update("Reply-Mapper.deleteReply",rno);
		session.close();
		
	}
	@Override
	public List<ReplyVO> selectReplyListPage(int bno, SearchCriteria cri) throws SQLException {
		SqlSession session=sessionFactory.openSession();
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<ReplyVO> replyList=
		session.selectList("Reply-Mapper.selectReplyList",bno,rowBounds);
		
		session.close();
		return replyList;
	}
	@Override
	public int countReply(int bno) throws SQLException {
		SqlSession session=sessionFactory.openSession();
		int count= 0;
		try {
			count = (Integer)session.selectOne("Reply-Mapper.countReply",bno);
		} finally {
			if(session!=null) session.close();
		}
		return count;
	}


	@Override
	public int selectReplySeqNextValue() throws SQLException {
		SqlSession session = sessionFactory.openSession();
		int rno = 0;
		
		try{
			rno = session.selectOne("Reply-Mapper.selectReplySeqValue", null);
		}finally {
			if(session!=null) session.close();
		}
		
		return rno;
	}
	
		
}




