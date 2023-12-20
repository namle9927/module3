package ra.serviceIpl;

import ra.dao.IUserDao;
import ra.daoIpl.UserDao;
import ra.model.User;
import ra.model.UserCount;
import ra.service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private static final IUserDao iUserDao = new UserDao();

    @Override
    public List<User> findAll() {
        return iUserDao.findAll();
    }

    @Override
    public List<User> findByUserName(String userName) {
        return iUserDao.findByUsertName(userName);
    }

    @Override
    public User findById(Long id) {
        return iUserDao.findById(id);
    }

    @Override
    public void save(User t) {
        iUserDao.save(t);
    }

    @Override
    public void delete(Long id) {
        iUserDao.delete(id);
    }

    @Override
    public List<UserCount> countUserByRole() {
        return iUserDao.countUserByRole();
    }
}
