package com.htabooks.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.StringJoiner;

import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.CartItem;

public class CartItemDao {
	private static CartItemDao instance = new CartItemDao();
	private CartItemDao() {}
	public static CartItemDao getInstance () { return instance; }

	DaoHelper helper = DaoHelper.getInstance();

	/**
	 * 유저 번호로 카트 아이템 가져오기
	 * @throws SQLException 
	 */
	public List<CartItem> getCartItemsByUserNo(int no) throws SQLException {
		String sql = "select c.cart_item_no, c.user_no, c.book_no, b.book_title, b.book_writer, b.paper_book_price, "
				+ "b.book_price, b.discount_rate, c.cart_item_created_date "
				+ "from ridi_cart_items c, ridi_books b "
				+ "where c.user_no = ? "
				+ "and c.book_no = b.book_no "
				+ "and c.deleted = 'N' ";

		return helper.selectList(sql, rs -> {
			CartItem item = new CartItem();
			item.setNo(rs.getInt("cart_item_no"));
			item.setUserNo(rs.getInt("user_no"));
			item.setBookNo(rs.getInt("book_no"));
			item.setTitle(rs.getString("book_title"));
			item.setWriter(rs.getString("book_writer"));
			item.setPaperBookPrice(rs.getInt("paper_book_price"));
			item.setBookPrice(rs.getInt("book_price"));
			item.setDiscountRate(rs.getInt("discount_rate"));
			item.setCreatedDate(rs.getDate("cart_item_created_date"));

			return item;
		}, no);
	}

	/**
	 * 세션 장바구니 용.
	 * 책 번호로 카트 아이템 가져오기
	 * @throws SQLException 
	 */
	public CartItem generateCartItemsByBookNo(int no) throws SQLException {
		String sql = "select book_no, book_title, book_writer, paper_book_price, "
				+ "book_price, discount_rate " 
				+ "from ridi_books "
				+ "where book_no = ? ";

		return helper.selectOne(sql, rs -> {
			CartItem item = new CartItem();
			item.setBookNo(rs.getInt("book_no"));
			item.setTitle(rs.getString("book_title"));
			item.setWriter(rs.getString("book_writer"));
			item.setPaperBookPrice(rs.getInt("paper_book_price"));
			item.setBookPrice(rs.getInt("book_price"));
			item.setDiscountRate(rs.getInt("discount_rate"));

			return item;
		}, no);
	}

	/**
	 * 카트 아이템 추가하기
	 * @throws SQLException 
	 */
	public void insertCartItem(CartItem item) throws SQLException {
		String sql = "insert into ridi_cart_items (cart_item_no, user_no, book_no) "
				+ "values (ridi_cartitems_seq.nextval, ?, ?) ";

		helper.insert(sql, item.getUserNo(), item.getBookNo());
	}

	/**
	 * 카트 아이템 삭제하기
	 * @param item
	 * @throws SQLException
	 */
	public void deleteCartItems(List<Integer> itemList) throws SQLException {
		String sql = "update ridi_cart_items "
				   + "set deleted = 'Y', "
				   + "    cart_item_updated_date = sysdate "
				   + "where cart_item_no in ";
		
		StringJoiner joiner = new StringJoiner(",");
		for (int i = 0; i < itemList.size(); i++) {
			joiner.add("?");
		}
		String sqlIn = "(" + joiner.toString() + ")";
		
		helper.update(sql + sqlIn, itemList.toArray());
	}
	
}
