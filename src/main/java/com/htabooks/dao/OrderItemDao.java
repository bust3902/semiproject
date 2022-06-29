package com.htabooks.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.StringJoiner;

import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.CartItem;
import com.htabooks.vo.OrderItem;

public class OrderItemDao {
	private static OrderItemDao instance = new OrderItemDao();
	private OrderItemDao() {}
	public static OrderItemDao getInstance () { return instance; }

	DaoHelper helper = DaoHelper.getInstance();

	/**
	 * 주문 번호로 주문 아이템 가져오기
	 * @throws SQLException 
	 */
	public List<OrderItem> getOrderItemsByOrderNo(int no) throws SQLException {
		String sql = "select order_item_no, order_no, o.book_no, order_item_price, b.book_title, b.book_writer "
				   + "from ridi_order_items o, ridi_books b "
				   + "where o.order_no = ? "
				   + "and o.book_no = b.book_no";

		return helper.selectList(sql, rs -> {
			OrderItem item = new OrderItem();
			item.setNo(rs.getInt("order_item_no"));
			item.setOrderNo(rs.getInt("order_no"));
			item.setBookNo(rs.getInt("book_no"));
			item.setPrice(rs.getInt("order_item_price"));
			item.setBookTitle(rs.getString("book_title"));
			item.setBookWriter(rs.getString("book_writer"));

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
	 * 주문 아이템 추가하기 (카트 주문 시)
	 * @throws SQLException 
	 */
	public void insertOrderItem(int cartItemNo, int orderNo) throws SQLException {
		String sql = "insert into ridi_order_items (order_item_no, order_no, book_no, order_item_price) "
				   + "select ridi_orderitems_seq.nextval, ?, b.book_no, b.book_price "
				   + "from ridi_books b, ridi_cart_items c "
				   + "where b.book_no = c.book_no "
				   + "and c.cart_item_no = ? ";

		helper.insert(sql, orderNo, cartItemNo);
	}
	
	/**
	 * 주문 아이템 추가하기 (바로 구매 시)
	 * @throws SQLException 
	 */
	public void insertOrderItem(OrderItem item) throws SQLException {
		String sql = "insert into ridi_order_items (order_item_no, order_no, book_no, order_item_price) "
				   + "values (ridi_orderitems_seq.nextval, ?, ?, ?) ";
		
		helper.insert(sql, item.getOrderNo(), item.getBookNo(), item.getPrice());
	}

	/**
	 * 카트 아이템 삭제하기
	 * @param item
	 * @throws SQLException
	 */
	public void deleteCartItems(List<Integer> itemList) throws SQLException {
		String sql = "update ridi_cart_items "
				   + "set deleted = 'Y' "
				   + "where cart_item_no in ";
		
		StringJoiner joiner = new StringJoiner(",");
		for (int i = 0; i < itemList.size(); i++) {
			joiner.add("?");
		}
		String sqlIn = "(" + joiner.toString() + ")";
		
		helper.update(sql + sqlIn, itemList.toArray());
	}
	
}

