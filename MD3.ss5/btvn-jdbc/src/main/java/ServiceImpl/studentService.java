package ServiceImpl;

import Dao.IManager;
import DaoImpl.ManagerImpl;
import Service.IstudentService;

public class studentService implements IstudentService {
    IManager student = new ManagerImpl();

    @Override
    public void creat() {
        student.create();
    }

    @Override
    public void read() {
        student.read();
    }

    @Override
    public void update() {
        student.update();
    }

    @Override
    public void delete() {
        student.delete();
    }
}
