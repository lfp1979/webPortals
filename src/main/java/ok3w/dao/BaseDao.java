package ok3w.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class BaseDao<T>{
	@Autowired
	protected SessionFactory sf;
	protected static Class getGenericType(Class clazz){
		Type genType = clazz.getGenericSuperclass();//得到泛型父类  
		Type[] types = ((ParameterizedType) genType).getActualTypeArguments();
		if (!(types[0] instanceof Class)) {
            return Object.class;   
        } 
		return (Class) types[0];
	}
	 protected Session getSession()
	  {
		 return sf.getCurrentSession();	 
	  }
	public T get(int id)
	  {
		 Session session=getSession();
		  T rt= (T) session.get(getGenericType(this.getClass()), id);
		  return rt;
	  }
	public int saveOrUpdate(T obj)
	  {
		  Session session=getSession();
		  session.saveOrUpdate(obj);
	      return 0;
	  }
	public int update(T obj)
	  {
		  Session session=getSession();
		  session.update(obj);
	      return 0;
	  }
	public int add(T obj)
	  {
	       Session session=getSession();
		   session.save(obj);
		   return 0;
	  }
	
	public int delete(T obj)
	    {
		    Session session=getSession();
			session.delete(obj);
			return 0;
	    }
	public int getCount()
	  {
		 String sql="select count(c) from "+getGenericType(getClass()).getName()+" c";
		  Session session=getSession();
		  Object obj = session.createQuery(sql).uniqueResult();
		  int result=((Long) obj).intValue();;
		  return result;
	  }
	public List<T> list()
	  {
		 ArrayList<T> alist=new ArrayList<T> ();
		 String sql="from "+getGenericType(getClass()).getName();
		  Session session=getSession();
		  alist = (ArrayList<T>) session.createQuery(sql).list();
		  return alist;
	  }
	public int del(Object id) {
		
		    Session session=getSession();
			session.delete(get((int) id));
		return 0;
	}
	public List<T> QueryByAttr(String attr,Object value, String paixu)
	  {
		
		 String className=getGenericType(getClass()).getName();
		 ArrayList<T> alist=new ArrayList<T> ();
		 String sql="from "+className+" where "+attr+" like :value order by "+paixu+" DESC";
		  Session session=sf.getCurrentSession();
		  alist = (ArrayList<T>) session.createQuery(sql)
				  .setParameter("value", "%"+value+"%").list();
	
		  return alist;
	  }

}
