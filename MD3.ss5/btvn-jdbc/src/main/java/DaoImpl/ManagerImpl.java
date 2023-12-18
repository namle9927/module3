package DaoImpl;

import Dao.IManager;
import model.Student;
import org.example.Main;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import static org.example.Main.connection;

public class ManagerImpl implements IManager {
    @Override
    public void create() {
        try {
            CallableStatement callableStatement = connection.prepareCall("insert into student values (?,?,?)");
            System.out.println("Nhap Id");
            callableStatement.setInt(1, new Scanner(System.in).nextInt());
            System.out.println("Nhap ten");
            callableStatement.setString(1, new Scanner(System.in).nextLine());
            System.out.println("Nhap gioi tinh");
            callableStatement.setBoolean(1, new Scanner(System.in).nextBoolean());
            int check = callableStatement.executeUpdate();
            if (check > 0) {
                System.out.println(" tao thanh cong");
            } else System.out.println("Tao that bai");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void read() {
        try {
            CallableStatement callableStatement = connection.prepareCall("SELECT * from student");
            ResultSet re = callableStatement.executeQuery();
            while (re.next()) {
                Student student = new Student();
                student.setId(re.getInt("student_id"));
                student.setName(re.getString("student_name"));
                student.setGender(re.getBoolean("student_gender"));
                System.out.println(student);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update() {
        try {
            CallableStatement callableStatement = connection.prepareCall("update student set student_name = ?, student_gerder = ? where student_id =?");
            System.out.println("Nhap id can sua");
            int id = new Scanner(System.in).nextInt();
            if (checkId(id)) {
                callableStatement.setInt(3, id);
                System.out.println("nhap ten moi");
                callableStatement.setString(1, new Scanner(System.in).nextLine());
                System.out.println("nhap gioi tinh moi");
                callableStatement.setBoolean(2, new Scanner(System.in).nextBoolean());
                int check = callableStatement.executeUpdate();
                if (check > 0) {
                    System.out.println(" cap nhat thanh cong");
                } else System.out.println("cap nhap that bai");
            } else System.out.println("ko tim thay Id");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    public void delete() {
        try {
            CallableStatement callableStatement = connection.prepareCall("delete from student where student_id = ?");
            System.out.println("hay nhap id can xoa");
            int id = new Scanner(System.in).nextInt();
            if (checkId(id)) {
                callableStatement.setInt(1, id);
                int check = callableStatement.executeUpdate();
                if (check>0){
                    System.out.println("xoa thanh cong");
                } else System.out.println("ko thay Id");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private boolean checkId(int id) {
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall("select * from student where student_id = ?");
            callableStatement.setInt(1, id);
            ResultSet re = callableStatement.executeQuery();
            if (re.next()) return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
}
