package ok3w.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;

import ok3w.entity.Admin;
import ok3w.service.Service;
@Controller
@Scope("prototype")
public class Login {
	@Autowired
	private Service service;
	 private String msg;
	 private String name;
	 private String pwd;
	 private String rand;
	 private String prePage;
	 private InputStream inputStream;
	 private boolean validate_rand()
	 {
		 String rand_str =(String)ServletActionContext.getContext().getSession().get("rand");
		 if(rand_str.equals(rand))
		   return true;
		  else 
		   return false;
	 }
	public String login() 
	{
		return "login";
	}
	public String logout() 
	{
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.remove("login");
		String msg="你已退出登陆！";
		
        try {
			setInputStream(new ByteArrayInputStream(msg.getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "logout";
	}
	public String validate() 
	{
	     Admin user=service.getAdmin(name);
          // 获取session
         Map<String, Object> session = ActionContext.getContext().getSession();
	     int today=Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
	  	 session.put("login", name);		    	
	     if(!validate_rand())
	     {
	      
	      msg="验证码不正确！";
	      return "login";	
	     }
	     if(user==null)
	     {
		    msg="用户名不存在！";
		    return "login";	
		  }
	     if(user.getLoginDate().getDate()!=today)
	     {
	    	user.setLoginDate(new Date(System.currentTimeMillis()));
	    	user.setErrorTimes(0);
	    	service.updateAdmin(user);
	     }
	       else if (user.getErrorTimes()==2)
	       {
	    	  msg="登陆次数达到！";
			    return "login";	
	       }
		 if (!service.validate(name, pwd))
		  {
			user.setErrorTimes(user.getErrorTimes()+1);
	    	service.updateAdmin(user);
	    	msg="用户名密码不正确！";
			return "login";
		  }	  
			prePage = (String) session.get("prePage");
			//清除session中的数据
			session.remove("prePage");
			
			//不是拦截器跳转到登陆页面的，直接访问的登陆页面
		 if (prePage != null) 
			return "prePage";

		 return "success"; 
}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getPrePage() {
		return prePage;
	}
	public void setPrePage(String prePage) {
		this.prePage = prePage;
	}
	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getRand() {
		return rand;
	}

	public void setRand(String rand) {
		this.rand = rand;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
}
