package com.htabooks.dao;

import java.sql.SQLException;
import java.util.List;

import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.CashHistory;
import com.htabooks.vo.User;

public class CashHistoryDao {

	//싱글턴 패턴
	private static CashHistoryDao instance = new CashHistoryDao();
	private CashHistoryDao() {}
	public static CashHistoryDao getInstance() {
		return instance;
	}
	
	//DaoHelper 
	private DaoHelper helper = DaoHelper.getInstance();
	
	
	/**
	 *  캐시 충전
	 * @param cashHistory 
	 * @throws SQLException
	 */
	public void insertCashHistory(CashHistory cashHistory) throws SQLException{
		String sql = "insert into ridi_user_cash_histories "
					+ "(cash_history_no, user_no, cash_history_reason, cash_amount, cash_current_amount )"
					+"values " 
						+"(RIDI_USER_CASH_SEQ.nextval, ?, ?, ?, ? )";

		helper.insert(sql, cashHistory.getUser().getNo(), cashHistory.getReason(), cashHistory.getAmount(), cashHistory.getCurrentAmount());
	}
	
	
	/**
	 * 캐시 변동 내역 조회 
	 * @param userNo 유저 넘버 
	 * @param beginIndex 첫번째 페이지 
	 * @param endIndex 마지막 페이지 
	 * @return
	 * @throws SQLException
	 */
	public List<CashHistory> getCashHistories(int userNo, int beginIndex, int endIndex) throws SQLException {
		String sql = "select cash_history_no, cash_history_updated_date, cash_amount, cash_history_reason, user_no "
				+ "   from (select h.cash_history_no, h.cash_history_updated_date ,h.cash_amount, h.cash_history_reason, h.user_no, "
				+ "            row_number() over (order by cash_history_no desc) row_number "
				+ "         from ridi_user_cash_histories h  "
				+ "         where user_no = ? )"
				+ "   where row_number >= ? and row_number <= ?";
				
				return helper.selectList(sql, rs -> {
					
					CashHistory cashHistory = new CashHistory();
					cashHistory.setNo(rs.getInt("cash_history_no"));
					cashHistory.setUpdatedDate(rs.getDate("cash_history_updated_date"));
					cashHistory.setAmount(rs.getInt("cash_amount"));
					cashHistory.setReason(rs.getString("cash_history_reason"));
					
					User user = new User();
					user.setNo(rs.getInt("user_no"));
					cashHistory.setUser(user);
					
					
					return cashHistory;
				}, userNo, beginIndex, endIndex);
		}
	
	
	/**
	 * history_no로 캐시내역을 조회
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public List<CashHistory> getCashHistoriesByNo(int userNo) throws SQLException {
		String sql = "select cash_history_no, cash_history_updated_date ,cash_amount, cash_history_reason, user_no "
				+ "   from ridi_user_cash_histories  "
				+ "   where user_no = ? "
				+ "   order by cash_history_no desc ";
		
		return helper.selectList(sql, rs -> {
			
			CashHistory cashHistory = new CashHistory();
			cashHistory.setNo(rs.getInt("cash_history_no"));
			cashHistory.setUpdatedDate(rs.getDate("cash_history_updated_date"));
			cashHistory.setAmount(rs.getInt("cash_amount"));
			cashHistory.setReason(rs.getString("cash_history_reason"));
			
			User user = new User();
			user.setNo(rs.getInt("user_no"));
			cashHistory.setUser(user);
			
			
			return cashHistory;
		}, userNo);
	}
	
	
	public List<CashHistory> getCashHistories(int beginIndex, int endIndex) throws SQLException {
		String sql = "select cash_history_no, cash_history_updated_date, cash_amount, cash_history_reason, user_no "
				+ "   from (select h.cash_history_no, h.cash_history_updated_date ,h.cash_amount, h.cash_history_reason, h.user_no, "
				+ "            row_number() over (order by cash_history_no desc) row_number "
				+ "         from ridi_user_cash_histories h  "
				+ "         where user_no = ? )"
				+ "   where row_number >= ? and row_number <= ?";
				
				return helper.selectList(sql, rs -> {
					
					CashHistory cashHistory = new CashHistory();
					cashHistory.setNo(rs.getInt("cash_history_no"));
					cashHistory.setUpdatedDate(rs.getDate("cash_history_updated_date"));
					cashHistory.setAmount(rs.getInt("cash_amount"));
					cashHistory.setReason(rs.getString("cash_history_reason"));
					
					User user = new User();
					user.setNo(rs.getInt("user_no"));
					cashHistory.setUser(user);
					
					
					return cashHistory;
				}, beginIndex, endIndex);
		}
	
	/**
	 * 캐시 충전 내역 조회
	 * @return
	 * @throws SQLException
	 */
		public int getTotalRows() throws SQLException {
			String sql = "select count(*) cnt "
					+ "from ridi_user_cash_histories "
					+ "where cash_amount > 1 ";
			
			return helper.selectOne(sql, rs-> {
				return rs.getInt("cnt");
			});
		
	}
}
