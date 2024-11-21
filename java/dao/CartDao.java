package dao;
import bean.CartBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.ArtDB;
public class CartDao {
    public boolean addToCart(CartBean cart) {
        String sql = "INSERT INTO cart (userid, artid, title, artist_name, category, price) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = ArtDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Set parameters from the CartBean object
            stmt.setInt(1, cart.getUserId());
            stmt.setInt(2, cart.getArtId());
            stmt.setString(3, cart.getTitle());
            stmt.setString(4, cart.getArtistName());
            stmt.setString(5, cart.getCategory());
            stmt.setDouble(6, cart.getPrice());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        }
    public List<CartBean> getCartItemsByUserId(int userId) {
        List<CartBean> cartItems = new ArrayList<>();
        String sql = "SELECT * FROM cart WHERE userid = ?";
        try (Connection conn = ArtDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                CartBean cart = new CartBean();
                cart.setCartId(rs.getInt("cartid"));
                cart.setUserId(rs.getInt("userid"));
                cart.setArtId(rs.getInt("artid"));
                cart.setTitle(rs.getString("title"));
                cart.setArtistName(rs.getString("artist_name"));
                cart.setCategory(rs.getString("category"));
                cart.setPrice(rs.getDouble("price"));
                cartItems.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    
    public int getUserIdByEmail(String email) {
        String sql = "SELECT userId FROM userreg WHERE email = ?";
        try (Connection conn = ArtDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("userId");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Return 0 if no user found
    }


    public boolean removeFromCart(int cartId) {
        String sql = "DELETE FROM cart WHERE cartid = ?";
        try (Connection conn = ArtDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
