package com.htabooks.dao;

import java.sql.SQLException;
import java.util.List;

import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.Banners;

public class BannerDao {

	private static BannerDao instance = new BannerDao();
	private BannerDao() {}
	public static BannerDao getInstance() {
		return instance;
	}
	
	private com.htabooks.helper.DaoHelper helper = DaoHelper.getInstance();
	
	/**
	 * 배너정보를 배너 테이블에 저장한다.
	 * @param banner 배너정보
	 * @throws SQLException
	 */
	public void insertBanner(Banners banner) throws SQLException{
		String sql = "INSERT INTO RIDI_BANNERS "
				   + "(BANNER_NO, BANNER_IMAGE_NAME, BANNER_SHOW_BEGIN_DATE, BANNER_SHOW_END_DATE) "
				   + "VALUES "
				   + "(RIDI_BANNERS_SEQ.NEXTVAL, ?, ?, ?) ";
		
		helper.insert(sql, banner.getImageName(), banner.getShowBeginDate(), banner.getShowLastDate());
	}
	
	/**
	 * home.jsp 에 출력 될 배너
	 * @return 현재 기간 중 출력 될 배너
	 * @throws SQLException
	 */
	public List<Banners> getBanner() throws SQLException{
		String sql = "SELECT BANNER_IMAGE_NAME, BANNER_SHOW_BEGIN_DATE, BANNER_SHOW_END_DATE, BANNER_LINK_ADDRESS "
				   + "FROM RIDI_BANNERS "
				   + "WHERE BANNER_SHOW_BEGIN_DATE < SYSDATE "
				   + "AND BANNER_SHOW_END_DATE > SYSDATE ";
		
		return helper.selectList(sql, rs -> {
			Banners banner = new Banners();
			banner.setImageName(rs.getString("BANNER_IMAGE_NAME"));
			banner.setShowBeginDate(rs.getDate("BANNER_SHOW_BEGIN_DATE"));
			banner.setShowLastDate(rs.getDate("BANNER_SHOW_END_DATE"));
			banner.setAddress(rs.getString("BANNER_LINK_ADDRESS"));
			return banner;
		});
		
	}
	
}
