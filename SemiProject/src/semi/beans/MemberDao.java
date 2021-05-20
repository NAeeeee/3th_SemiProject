package semi.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {

	public void signUp(MemberDto memberDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into member values(member_seq.nextval, ?, ?, ?, ?, ?, ?,?, 0, ?, 'N', sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getMemberId());
		ps.setString(2, memberDto.getMemberPw());
		ps.setString(3, memberDto.getMemberName());
		ps.setDate(4, memberDto.getMemberBirth());
		ps.setString(5, memberDto.getMemberGender());
		ps.setString(6, memberDto.getMemberEmail());
		ps.setString(7, memberDto.getMemberAddress());
		ps.setString(8, memberDto.getMemberPhone());
		ps.execute();
		
		con.close();
	}

	public Integer login(MemberDto memberDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from member where member_id=? and member_pw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getMemberId());
		ps.setString(2, memberDto.getMemberPw());

		ResultSet rs =  ps.executeQuery();
		Integer no;
		if(rs.next()) {
			no=rs.getInt("member_no");
		}else {
			no = null;
		}
		con.close();
		return no;
	}
	
	public MemberDto getMember(int memberNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from member where member_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, memberNo);

		ResultSet rs =  ps.executeQuery();
		MemberDto md = new MemberDto();;
		if(rs.next()) {
			md.setMemberAddress(rs.getString("member_address"));
			md.setMemberBirth(rs.getDate("member_birth"));
			md.setMemberEmail(rs.getString("member_email"));
			md.setMemberGender(rs.getString("member_gender"));
			md.setMemberId(rs.getString("member_id"));
			md.setMemberName(rs.getString("member_name"));
			md.setMemberPhone(rs.getString("member_phone"));
			md.setMemberPw(rs.getString("member_pw"));
			md.setMemberJoin(rs.getDate("member_join"));
			md.setMemberPoint(rs.getInt("member_point"));
			md.setMemberAdmin(rs.getString("member_admin"));
		}
		con.close();
		return md;
	}
	
}
