package ok3w.action;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

import ok3w.entity.Article;
import ok3w.entity.Clazz;
import ok3w.service.Service;

@Controller
@Scope("prototype")
public class ArticleAdmin extends ActionSupport implements Preparable{
	@Autowired
	private Service service;
	private List<Article> articles;
	private List<Clazz> sorts;
	private int[] ids;
	private int id;
	private int pageNum;
	private String pagination,cmd,uploadResponse;
	private Article article;
	private int numsPerPage=10;
	private String stype;
	private String keyword;
	private String msg;
	private String paixu;
	private boolean isSearch=false;
	public String search()
	{
		isSearch=true;
		articles=service.QueryArticlesByAttr(stype, keyword,paixu);
		return "list";
	}
	public String uploadFiles()
	{
		return cmd;
	}
	public String saveOrUpdate()
	{
		service.articleSaveOrUpdate(article);
		msg="保存成功！";
		return "saveOrUpdate";
	}
	public String update()
	{
		for(int id:ids)
		{
		 service.setArticleProperry(cmd, id);
		}
		msg="操作成功！";
		//ids=null;
		return isSearch?search():list();
	}
	public String add()
	{
		article=new Article();
		article.setAddTime(new Date());
		return "add";
	}
	public String edit()
	{
		article=service.getArticleFull(id);
		try {
			if(msg!=null)
			msg=new String(msg.getBytes("ISO-8859-1"),"utf8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "edit";
	}
	public String list()
	{
		pageNum=(pageNum==0)?1:pageNum;
		articles=service.listArticlesByPage(pageNum, numsPerPage);
		pagination=service.articlePagination(pageNum, numsPerPage);
		
		return "list";
	}
	public List<Article> getArticles() {
		return articles;
	}
	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
	public String getStype() {
		return stype;
	}
	public void setStype(String stype) {
		this.stype = stype;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public String getPagination() {
		return pagination;
	}
	public void setPagination(String pagination) {
		this.pagination = pagination;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public List<Clazz> getSorts() {
		return sorts;
	}
	public void setSorts(List<Clazz> sorts) {
		this.sorts = sorts;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCmd() {
		return cmd;
	}
	public void setCmd(String cmd) {
		this.cmd = cmd;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int[] getIds() {
		return ids;
	}
	public void setIds(int[] ids) {
		this.ids = ids;
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getPaixu() {
		return paixu;
	}
	public void setPaixu(String paixu) {
		this.paixu = paixu;
	}
	
	public boolean getIsSearch() {
		return isSearch;
	}
	public void setIsSearch(boolean isSearch) {
		this.isSearch = isSearch;
	}
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub

		sorts=service.buildListSorts(service.listSorts());
		
	}
}
