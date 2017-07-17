package de.tum.in.dbpra.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import de.tum.in.dbpra.model.bean.ProductBean;
import de.tum.in.dbpra.model.bean.ProductListBean;

public class ProductDAO extends DAO{
	
	public void getProducts(ProductListBean productlist) throws SQLException, ClassNotFoundException {
		
		String query = "SELECT * FROM product;";	
		
		Connection con = getConnection();
		con.setAutoCommit(false);
		
		
		
		PreparedStatement pstmt = con.prepareStatement(query);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ProductBean product = new ProductBean();
			product.setProductID(rs.getInt("productid"));
			product.setName(rs.getString("name"));
			product.setType(rs.getString("producttype"));
			product.setPrice(rs.getDouble("price"));
			productlist.setChild(product);
		} 
		
		con.commit();
		rs.close();
		pstmt.close();
		con.close();
		
	}
	
	public void insertProduct(String name, String type, double price)throws SQLException, ClassNotFoundException {
		
		String query = "INSERT INTO product (name,producttype,price) VALUES (?,?::\"producttype\",?);";	
		
		Connection con = getConnection();
		con.setAutoCommit(false);
		PreparedStatement pstmt = con.prepareStatement(query);
		
		/*if(price==null) {
			throw new SQLException("Please enter a description for the price");
		}*/
		if(price<=0) {
			throw new SQLException("Price must be more than 0");
		}
		if(price>=10000) {
			throw new SQLException("Price must be less than 10000");
		}
		if(name==""||name==null) {
			throw new SQLException("Please enter a name");
		}
		
		pstmt.setString(1, name);
		pstmt.setString(2, type);
		pstmt.setDouble(3, price);
		
		
		
		pstmt.executeUpdate();
		
		
		con.commit();

		pstmt.close();
		con.close();
		
	}
	
	
}
