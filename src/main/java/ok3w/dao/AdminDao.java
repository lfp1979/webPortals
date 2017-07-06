package ok3w.dao;

import org.springframework.stereotype.Repository;

import ok3w.entity.Admin;
import ok3w.util.MD5;
@Repository
public class AdminDao extends BaseDao<Admin> {
	public boolean validate(String user,String pwd) {
		MD5 md5=new MD5();
		pwd=md5.getMD5ofStr(pwd);  
		Admin admin=(Admin) getSession()
				.createQuery("from Admin where adminName=:adminName and adminPwd=:adminPwd")
				.setString("adminName", user).setString("adminPwd", pwd)
				.uniqueResult();
		return  admin != null;
	    }
	
	public Admin get(String name)  {
		Admin admin=(Admin) getSession()
				.createQuery("from Admin where adminName=:adminName")
				.setString("adminName", name)
				.uniqueResult();
		return  admin;
	  }
}
