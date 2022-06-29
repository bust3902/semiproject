package com.htabooks.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.StringJoiner;

import com.htabooks.dto.OrderDto;
import com.htabooks.helper.DaoHelper;
import com.htabooks.vo.CartItem;
import com.htabooks.vo.Order;

public class OrderDao {
	private static OrderDao instance = new OrderDao();
	private OrderDao() {}
	public static OrderDao getInstance () { return instance; }

	DaoHelper helper = DaoHelper.getInstance();

	/**
	 * 유저 번호로 주문 정보 가져오기
	 * @throws SQLException 
	 */
	public List<OrderDto> getOrdersByUserNo(int no) throws SQLException {
		String sql = "with title_and_count "
				+ "as (select order_no, book_no, count(*) over (partition by order_no) book_cnt, row_number() over (partition by order_no order by book_no) rnum "
				+ "    from ridi_order_items) "
				+ "select o.order_no, o.order_created_date, b.book_title, c.book_cnt, o.total_payment_price "
				+ "from ridi_orders o, title_and_count c, ridi_books b "
				+ "where rnum = 1 "
				+ "and o.order_no = c.order_no "
				+ "and c.book_no = b.book_no "
				+ "and o.user_no = ? ";

		return helper.selectList(sql, rs -> {
			OrderDto order = new OrderDto();
			order.setOrderNo(rs.getInt("order_no"));
			order.setCreatedDate(rs.getDate("order_created_date"));
			order.setBookTitle(rs.getString("book_title"));
			order.setBookCount(rs.getInt("book_cnt"));
			order.setTotalPrice(rs.getInt("total_payment_price"));

			return order;
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
	 * 주문 추가하기
	 * @throws SQLException 
	 */
	public void insertOrder(Order order) throws SQLException {
		String sql = "insert into ridi_orders (order_no, order_status, total_payment_price, user_no) "
				+ "values (?, '결제완료', ?, ?) ";

		helper.insert(sql, order.getNo(), order.getTotalPaymentPrice(), order.getUserNo());
	}
	
	/**
	 * ORDER 시퀀스 값 얻기
	 * @return ORDERS 시퀀스 값
	 * @throws SQLException
	 */
	public int getOrderNo() throws SQLException {
		String sql = "select ridi_orders_seq.nextval orderNo from dual";
		
		return helper.selectOne(sql, rs -> rs.getInt("orderNo"));
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

