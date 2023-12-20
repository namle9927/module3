package present;


import ra.model.UserCount;
import ra.service.IUserService;
import ra.serviceIpl.UserService;
import ra.util.IputMethod;
import ra.model.User;

import java.util.List;

public class UserManager {
    private static final IUserService userService = new UserService();

    public static void main(String[] args) {
        while (true) {
            System.out.println("menu");
            System.out.println("1.hien thi ds user");
            System.out.println("2.them moi");
            System.out.println("3. chinh sua thep id");
            System.out.println("4. xoa");
            System.out.println("5. tim theo ten");
            System.out.println("6. dem user theo Role");
            System.out.println("7. thoat");
            System.out.println("nhap lua chon cua ban");
            byte choice = IputMethod.getByte();
            switch (choice) {
                case 1:
                    displauAllUser();
                    break;
                case 2:
                    addUser();
                    break;
                case 3:
                    updateUser();
                    break;
                case 4:
                    deleteUser();
                    break;
                case 5:
                    findByUserName();
                    break;
                case 6:
                    countUserByRole();
                    break;
                case 7:
                    System.exit(0);
                    break;
                default:
                    System.err.println("nhap sai");
                    break;
            }
        }

    }

    private static void findByUserName(
    ) {
        System.out.println("hay nhap ten can tim");
        String name = IputMethod.getString();
        List<User> users = userService.findByUserName(name);
        for (User u : users
        ) {
            System.out.println(u);
        }
    }

    private static void displauAllUser() {
        List<User> users = userService.findAll();
        if (users.isEmpty()) {
            System.err.println("danh sach trong");
            return;
        }
        for (User u : users
        ) {
            System.out.println(u);
        }
    }

    private static void addUser() {
        System.out.println("nhap so luong can them");
        int count = IputMethod.getInteger();
        for (int i = 1; i <= count; i++) {
            System.out.println("nhap thong tin sinh vien thi " + i);
            System.out.println("nhap ho ten");
            String fullName = IputMethod.getString();
            System.out.println("nhap SDT");
            Long phone = IputMethod.getLong();
            System.out.println("nhap dia chi");
            String address = IputMethod.getString();
            System.out.println("nhap trang thai");
            Boolean status = IputMethod.getBoolean();
            System.out.println("nhap ho role-id");
            Long role_id = IputMethod.getLong();
            User u = new User(null, fullName, phone, address, status, role_id);
            userService.save(u);
        }
        System.out.println("da them" + count + "user");
    }

    private static void updateUser() {
        System.out.println("nhap id User can sua");
        Long id = IputMethod.getLong();
        System.out.println("nhap thong tin User can sua ");
        System.out.println("nhap ho ten");
        String fullName = IputMethod.getString();
        System.out.println("nhap SDT");
        Long phone = IputMethod.getLong();
        System.out.println("nhap dia chi");
        String address = IputMethod.getString();
        System.out.println("nhap trang thai");
        Boolean status = IputMethod.getBoolean();
        System.out.println("nhap ho role-id");
        Long role_id = IputMethod.getLong();
        User u = new User(id, fullName, phone, address, status, role_id);
        userService.save(u);

        System.out.println("da them sua thanh cong user co id" + id);
        System.out.println(userService.findById(id));
    }

    private static void deleteUser() {
        System.out.println("nhap id User can xoa");
        Long id = IputMethod.getLong();
        userService.delete(id);
        System.out.println("da xoa thanh cong User co id: " + id);
        System.out.println("danh sach sau khi xoa la:");
        System.out.println(userService.findAll());
    }
    private static void countUserByRole(){
        List<UserCount> countTable = userService.countUserByRole();
        for (UserCount u : countTable
        ) {
            System.out.println(u);
        }
    };
}
