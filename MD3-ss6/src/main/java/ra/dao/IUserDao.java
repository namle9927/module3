package ra.dao;

import ra.model.User;
import ra.model.UserCount;

import java.util.List;

public interface IUserDao extends IGenericDao<User,Long>{
    List<User> findByUsertName(String userName);
    List<UserCount> countUserByRole();

}
