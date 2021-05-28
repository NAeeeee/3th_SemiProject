package semi.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NoticeBoardDao {
	// 시퀀스 번호를 생성하는 기능
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "select notice_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int no = rs.getInt(1);

		con.close();
		return no;
	}

	 // 등록
    public void insert(NoticeBoardDto noticeBoardDto) throws Exception {
        Connection con = JdbcUtils.getConnection();
        
        String sql = "insert into notice_board values(notice_seq.nextval, ?, ?, ?, ?, sysdate, 0)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, noticeBoardDto.getNoticeBoardHeader());
        ps.setString(2, noticeBoardDto.getNoticeBoardTitle());
        ps.setString(3, noticeBoardDto.getNoticeBoardContent());
        ps.setInt(4, noticeBoardDto.getNoticeBoardWriter());
        ps.execute();
       
        con.close();
    }

//상세보기 기능
	public NoticeBoardDto get(int noticeBoardNo) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "select * from notice_board where notice_board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, noticeBoardNo);
		ResultSet rs = ps.executeQuery();

		NoticeBoardDto boardDto;
		if (rs.next()) {
			boardDto = new NoticeBoardDto();

			boardDto.setNoticeBoardNo(rs.getInt("notice_board_no"));
			boardDto.setNoticeBoardHeader(rs.getString("notice_board_header"));
			boardDto.setNoticeBoardTitle(rs.getString("notice_board_title"));
			boardDto.setNoticeBoardContent(rs.getString("notice_board_content"));
			boardDto.setNoticeBoardWriter(rs.getInt("notice_board_writer"));
			boardDto.setNoticeBoardTime(rs.getDate("notice_board_time"));
			boardDto.setNoticeBoardRead(rs.getInt("notice_board_read"));

		} else {
			boardDto = null;
		}

		con.close();

		return boardDto;
	}

// 게시물 수정 기능
	public boolean edit(NoticeBoardDto noticeBoardDto) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "update notice_board set notice_board_header=?, notice_board_title=?, notice_board_content=?, notice_board_time=sysdate where notice_board_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, noticeBoardDto.getNoticeBoardHeader());
		ps.setString(2, noticeBoardDto.getNoticeBoardTitle());
		ps.setString(3, noticeBoardDto.getNoticeBoardContent());
		ps.setInt(4, noticeBoardDto.getNoticeBoardNo());
		int count = ps.executeUpdate();

		con.close();
		return count > 0;
	}

// 삭제 기능
	public boolean delete(int noticeBoardNo) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "delete notice_board where notice_board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, noticeBoardNo);
		int count = ps.executeUpdate();

		con.close();

		return count > 0;
	}

// 목록 기능
	public List<NoticeBoardDto> list(int startRow, int endRow) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "select * from( " + "	select rownum rn, TMP.* from( "
				+ "		select * from notice_board order by notice_board_no desc " 
				+ "	)TMP "
				+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, startRow);
		ps.setInt(2, endRow);
		ResultSet rs = ps.executeQuery();

		// List로 변환
		List<NoticeBoardDto> boardList = new ArrayList<>();
		while (rs.next()) {
			NoticeBoardDto boardDto = new NoticeBoardDto();
			boardDto.setNoticeBoardNo(rs.getInt("notice_board_no"));
			boardDto.setNoticeBoardHeader(rs.getString("notice_board_header"));
			boardDto.setNoticeBoardTitle(rs.getString("notice_board_title"));
			boardDto.setNoticeBoardWriter(rs.getInt("notice_board_writer"));
			boardDto.setNoticeBoardTime(rs.getDate("notice_board_time"));
			boardDto.setNoticeBoardContent(rs.getString("notice_board_content"));
			boardDto.setNoticeBoardRead(rs.getInt("notice_board_read"));

			boardList.add(boardDto);
		}
		con.close();
		return boardList;
	}

// 	title 조회 목록 기능
	public List<NoticeBoardDto> titleList(String noticeBoardHeader, int startRow, int endRow) throws Exception {
		Connection con = JdbcUtils.getConnection();
	
		String sql = "select * from( " + "	select rownum rn, TMP.* from( "
				+ "		select * from notice_board where notice_board_header=? order by notice_board_no desc " 
				+ "	)TMP "
				+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, noticeBoardHeader);
		ps.setInt(2, startRow);
		ps.setInt(3, endRow);
		ResultSet rs = ps.executeQuery();
		
		// List로 변환
		List<NoticeBoardDto> boardList = new ArrayList<>();
		while (rs.next()) {
			NoticeBoardDto boardDto = new NoticeBoardDto();
			boardDto.setNoticeBoardNo(rs.getInt("notice_board_no"));
			boardDto.setNoticeBoardHeader(rs.getString("notice_board_header"));
			boardDto.setNoticeBoardTitle(rs.getString("notice_board_title"));
			boardDto.setNoticeBoardWriter(rs.getInt("notice_board_writer"));
			boardDto.setNoticeBoardTime(rs.getDate("notice_board_time"));
			boardDto.setNoticeBoardContent(rs.getString("notice_board_content"));
			boardDto.setNoticeBoardRead(rs.getInt("notice_board_read"));
	
			boardList.add(boardDto);
		}
		con.close();
		return boardList;
	}
	
//  전체목록 페이지블럭 계산을 위한 카운트 기능(목록/검색)
	public int getCount() throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "select count(*) from notice_board";
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);

		con.close();

		return count;
	}
	
	public boolean refreshBoardRead(int noticeBoardNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "update notice_board set notice_board_read = notice_board_read + 1 where notice_board_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, noticeBoardNo);
		int count = ps.executeUpdate();
		con.close();
		return count > 0;
	}
}