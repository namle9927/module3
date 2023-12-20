package ra.service;

import ra.model.User;
import ra.model.UserCount;

import java.util.List;

public interface IUserService {
    List<User> findAll();
    List<User> findByUserName(String userName);
    User findById(Long id);
    void save(User t);
    void delete(Long id);
    List<UserCount> countUserByRole();

}
