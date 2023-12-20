package ra.daoIpl;

import ra.dao.IUserDao;
import ra.model.User;
import ra.model.UserCount;
import ra.util.ConnectDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class UserDao implements IUserDao {

    @Override
    public List<User> findAll() {
        List<User> list = new ArrayList<>();
        Connection conn = null;
        conn = ConnectDB.openConnection();
        try {
            CallableStatement call = conn.prepareCall("SELECT * FROM User");
            ResultSet rs = call.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getLong("id"));
                u.setFull_name(rs.getString("full_name"));
                u.setPhone(rs.getLong("phone"));
                u.setAddress(rs.getString("address"));
                u.setStatus(rs.getBoolean("status"));
                u.setRole_id(rs.getLong("role_id"));
                list.add(u);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectDB.closeConnection(conn);
        }
        return list;
    }

    @Override
    public User findById(Long id) {
        User u = null;
        Connection conn;
        conn = ConnectDB.openConnection();
        try {
            CallableStatement call = conn.prepareCall("SELECT * FROM User where id = ?");
            call.setLong(1, id);
            ResultSet rs = call.executeQuery();
            if (rs.next()) {
                u.setUser_id(rs.getLong("id"));
                u.setFull_name(rs.getString("full_name"));
                u.setPhone(rs.getLong("phone"));
                u.setAddress(rs.getString("address"));
                u.setStatus(rs.getBoolean("status"));
                u.setRole_id(rs.getLong("role_id"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectDB.closeConnection(conn);
        }
        return u;
    }

    @Override
    public void save(User user) {
        Connection conn = ConnectDB.openConnection();
        CallableStatement call = null;
        try {
            if (user.getUser_id() == null) {
                call = conn.prepareCall("insert into User(full_name, phone, address, status, role_id) VALUE (?,?,?,?,?)");
                call.setString(1, user.getFull_name());
                call.setLong(2, user.getPhone());
                call.setString(3, user.getAddress());
                call.setBoolean(4, user.getStatus());
                call.setLong(5, user.getRole_id());
            } else {
                call = conn.prepareCall("UPDATE User set full_name =?, phone =?, address=?, status=?, role_id=? where id = ?");
                call.setString(1, user.getFull_name());
                call.setLong(2, user.getPhone());
                call.setString(3, user.getAddress());
                call.setBoolean(4, user.getStatus());
                call.setLong(5, user.getRole_id());
                call.setLong(6, user.getUser_id());
            }
            call.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectDB.closeConnection(conn);
        }
    }

    @Override
    public void delete(Long id) {
        Connection conn = ConnectDB.openConnection();
        try {

        CallableStatement call = conn.prepareCall("DELETE from User where id=?");
        call.setLong(1,id);
        call.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectDB.closeConnection(conn);
        }
    }

    @Override
    public List<User> findByUsertName(String userName) {
        List<User> list = new ArrayList<>();
        Connection conn = null;
        conn = ConnectDB.openConnection();
        try {
            CallableStatement call = conn.prepareCall("SELECT * FROM User");
            ResultSet rs = call.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getLong("id"));
                u.setFull_name(rs.getString("full_name"));
                u.setPhone(rs.getLong("phone"));
                u.setAddress(rs.getString("address"));
                u.setStatus(rs.getBoolean("status"));
                u.setRole_id(rs.getLong("role_id"));
                list.add(u);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectDB.closeConnection(conn);
        }
        return list.stream().filter((u) -> u.getFull_name().contains(userName)).collect(Collectors.toList());
    }

    @Override
    public List<UserCount> countUserByRole() {
        List<UserCount> list = new ArrayList<>();
        Connection conn = null;
        conn = ConnectDB.openConnection();
        try {
            CallableStatement call = conn.prepareCall("select role_name,count(id) from user u inner join Role R on u.role_id = R.id_role group by role_id;");
            ResultSet rs = call.executeQuery();
            while (rs.next()) {
                UserCount u = new UserCount();
                u.setRoleName(rs.getString("role_name"));
                u.setCount(rs.getInt("count(id)"));
                list.add(u);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectDB.closeConnection(conn);
        }
        return list;
    }
}
