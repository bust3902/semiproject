package com.htabooks.dao;

import java.sql.SQLException;

import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.CashHistory;
import com.htabooks.vo.User;

public class CashHistoryDao {

	private static CashHistoryDao instance = new CashHistoryDao();
	private CashHistoryDao() {}
	public static CashHistoryDao getInstance() {
		return instance;
	}
	
	private DaoHelper helper = DaoHelper.getInstance();
	
	// 캐시 충전 및 사용
	public void insertCashHistory(CashHistory cashHistory) throws SQLException{
		String sql = "insert into ridi_user_cash_histories "
					+ "(cash_history_no, user_no, cash_history_reason, cash_amount, cash_current_amount )"
					+"values " 
						+"(RIDI_USER_CASH_SEQ.nextval, ?, ?, ?, ? )";

		helper.insert(sql, cashHistory.getUser().getNo(), cashHistory.getReason(), cashHistory.getAmount(), cashHistory.getCurrentAmount());
	}
	

}
