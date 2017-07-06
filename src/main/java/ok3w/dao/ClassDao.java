package ok3w.dao;

import org.springframework.stereotype.Repository;

import ok3w.entity.Clazz;
@Repository
public class ClassDao extends BaseDao<Clazz> {
	public Clazz find(int parentId,int orderId)
	{
		Clazz clazz=(Clazz) getSession()
		.createQuery("select  c from Clazz as c where c.parent.id=:parentId and c.orderID=:orderId")
		.setInteger("parentId", parentId).setInteger("orderId", orderId).uniqueResult();
		return clazz;
		
	}
	
}
