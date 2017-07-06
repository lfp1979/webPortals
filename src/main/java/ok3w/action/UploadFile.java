package ok3w.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Scope("prototype")
@Controller
public class UploadFile {
	private File file1;
	private String msg;
	private String file1FileName;
	private String file1ContentType;
	public String upload() throws IOException
	{
		String path=ServletActionContext.getServletContext().getRealPath("/upfiles/e");
		long date=System.currentTimeMillis();
		String fileType=file1FileName.substring(file1FileName.length()-3);
		String fileName="/"+String.format("%d", date)+"."+fileType;
		FileOutputStream fos=new FileOutputStream(path+fileName);
		FileInputStream fin=new FileInputStream(file1);
		msg="/webPortals/upfiles/e"+fileName;
		byte[] buffer=new byte[1024];
		int len;
		while((len=fin.read(buffer))>0)
			fos.write(buffer, 0, len);
		return "success";
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

	public File getFile1() {
		return file1;
	}

	public void setFile1(File file1) {
		this.file1 = file1;
	}

	public String getFile1FileName() {
		return file1FileName;
	}

	public void setFile1FileName(String file1FileName) {
		this.file1FileName = file1FileName;
	}

	public String getFile1ContentType() {
		return file1ContentType;
	}

	public void setFile1ContentType(String file1ContentType) {
		this.file1ContentType = file1ContentType;
	}

	
}
