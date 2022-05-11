package dao;

import com.shopping.vo.products.Products;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ProductsDAO {

    private static final ProductsDAO dao = new ProductsDAO();

    private ProductsDAO() {
    }

    public static ProductsDAO getInstance() {
        return dao;
    }

    public Connection getConnection() {
        Connection conn = null;
        InitialContext ic = null;
        DataSource ds = null;
        try {
            // 1. JNDI 서버 객체 생성
            ic = new InitialContext();

            // 2. lookup()
            ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
            if(ds == null) {
            	System.out.println("ds null");
            }
            // 3. getConnection()
            conn = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            conn.close();
            pstmt.close();
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void close(Connection conn, PreparedStatement pstmt) {
        try {
            conn.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public int insertProduct(Products product) {

        Connection conn = getConnection();

        PreparedStatement pstmt = null;


        //INSERT INTO Products VALUES('P001','아이패드 프로 2세대','944900','당신의 다음 컴퓨터는 컴퓨터가 아니다','Apple','테블릿', 1, 'fileName');
        String sql = "INSERT INTO Products VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

        int result = -1;

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, product.getProId());
            pstmt.setString(2, product.getProName());
            pstmt.setInt(3, product.getUnitPrice());
            pstmt.setString(4, product.getDescription());
            pstmt.setString(5, product.getManufacturer());
            pstmt.setString(6, product.getCategory());
            pstmt.setInt(7, product.getNoOfStock());
            pstmt.setString(8, product.getFileName());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, pstmt);
        }

        return result;
    }
    public Products selectProduct(String proId) {
        Products product = null;
        Connection conn = getConnection();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM Products WHERE proId = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, proId);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                product  = new Products(rs.getString("proId"),
                        rs.getString("proName"),
                        rs.getInt("unitPrice"),
                        rs.getString("description"),
                        rs.getString("manufacturer"),
                        rs.getString("category"),
                        rs.getInt("noOfStock"),
                        rs.getString("fileName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, pstmt, rs);
        }

        return product;
    }
    
    
    public ArrayList<Products> selectProductAll() {
        ArrayList<Products> products = new ArrayList<Products>();
        Connection conn = getConnection();
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM PRODUCTS";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Products product  = new Products(rs.getString("proId"),
                        rs.getString("proName"),
                        rs.getInt("unitPrice"),
                        rs.getString("description"),
                        rs.getString("manufacturer"),
                        rs.getString("category"),
                        rs.getInt("noOfStock"));

                products.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, pstmt, rs);
        }

        return products;
    }
}

