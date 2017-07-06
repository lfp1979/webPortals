package ok3w.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.Preparable;

import ok3w.entity.Article;
import ok3w.entity.Clazz;
import ok3w.entity.UrlLink;
import ok3w.service.Service;

@Controller
@Scope("prototype")
public class ArticleAction  implements Preparable{
	@Autowired
	private Service service;
	private int articleId;
	private int classId;
	private int orderId;
	private Article article;
	private Article moveArticle;
	private Clazz clazz;
	private Clazz clazz0;
	private List<Article> top15;
	private List<Article> new15;
	private List<Article> articleList;
	private List<Article> picList;
	private List<UrlLink> urlList;
	private Map<String,String> path;
	public String getClassArticles()
	{
		clazz=service.getClassWithChild(classId);
		articleList=service.getClassArticles(classId);
		path=service.getClassPath(clazz);
		top15=service.getClassArticlesOrderByHits(classId, 15);
		return "getClassArticles";
		
	}
	public String listByOrderId()
	{
		
		clazz=service.getClass(0, orderId);
		articleList=service.getClassArticles(clazz.getId(),8);
		return "listByOrder";
		
	}
	public String index()
	{
		picList=service.getPicList();
		articleList=service.getClassArticles(0,18);
		clazz=service.getClassWithChild(0);
		urlList=service.getUrlLinks();
		return "index";
	}
	public String show()
	{
		article=service.getArticleFull(articleId);
		path=service.getArticlePath(article);
		service.addArticleHits(article);
		new15=service.getClassArticlesOrderAddTime(article.getClazz().getId(), 15);
		return "show";
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public Map<String,String> getPath() {
		return path;
	}
	public void setPath(Map<String,String> path) {
		this.path = path;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Clazz getClazz() {
		return clazz;
	}
	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}
	public List<Article> getArticleList() {
		return articleList;
	}
	public void setArticleList(List<Article> articleList) {
		this.articleList = articleList;
	}
	public List<Article> getPicList() {
		return picList;
	}
	public void setPicList(List<Article> picList) {
		this.picList = picList;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public Article getMoveArticle() {
		return moveArticle;
	}
	public void setMoveArticle(Article moveArticle) {
		this.moveArticle = moveArticle;
	}
	public List<UrlLink> getUrlList() {
		return urlList;
	}
	public void setUrlList(List<UrlLink> urlList) {
		this.urlList = urlList;
	}
	public List<Article> getTop15() {
		return top15;
	}
	public void setTop15(List<Article> top15) {
		this.top15 = top15;
	}
	public List<Article> getNew15() {
		return new15;
	}
	public void setNew15(List<Article> new15) {
		this.new15 = new15;
	}
	public Clazz getClazz0() {
		return clazz0;
	}
	public void setClazz0(Clazz clazz0) {
		this.clazz0 = clazz0;
	}
	
	@Override
	public void prepare() throws Exception {
		clazz0=service.getClassWithChild(0);
		moveArticle=service.getMoveArticle();
		
	}
}
