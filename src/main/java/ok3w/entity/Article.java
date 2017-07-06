package ok3w.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the ok3w_article database table.
 * 
 */
@Entity
@Table(name="ok3w_article")
public class Article implements Serializable {
	public Article(int id, Date addTime, String author,  String comeFrom, String content, int hits,
			String inputer, boolean isCommend, boolean isDelete, boolean isMove, boolean isPass, boolean isPic,
			boolean isPlay, boolean isTop, String picFile, String sortPath, String title, Clazz clazz) {
		super();
		this.id = id;
		this.addTime = addTime;
		this.author = author;
		this.comeFrom = comeFrom;
		this.content = content;
		this.hits = hits;
		this.inputer = inputer;
		this.isCommend = isCommend;
		this.isDelete = isDelete;
		this.isMove = isMove;
		this.isPass = isPass;
		this.isPic = isPic;
		this.isPlay = isPlay;
		this.isTop = isTop;
		this.picFile = picFile;
		this.sortPath = sortPath;
		this.title = title;
		this.clazz = clazz;
	}

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	private Date addTime;

	private String author;

	private String comeFrom;

	private String content;

	private int hits;

	private String inputer;

	private boolean isCommend;

	private boolean isDelete;

	private boolean isMove;

	private boolean isPass;

	private boolean isPic;

	private boolean isPlay;

	private boolean isTop;

	private String picFile;

	private String sortPath;

	private String title;

	//bi-directional many-to-one association to Clazz
	@ManyToOne
	@JoinColumn(name="ClassID")
	private Clazz clazz;

	public Article() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	

	public String getComeFrom() {
		return this.comeFrom;
	}

	public void setComeFrom(String comeFrom) {
		this.comeFrom = comeFrom;
	}

	public Object getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHits() {
		return this.hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getInputer() {
		return this.inputer;
	}

	public void setInputer(String inputer) {
		this.inputer = inputer;
	}

	public boolean getIsCommend() {
		return this.isCommend;
	}

	public void setIsCommend(boolean isCommend) {
		this.isCommend = isCommend;
	}

	public boolean getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}

	public boolean getIsMove() {
		return this.isMove;
	}

	public void setIsMove(boolean isMove) {
		this.isMove = isMove;
	}

	public boolean getIsPass() {
		return this.isPass;
	}

	public void setIsPass(boolean isPass) {
		this.isPass = isPass;
	}

	public boolean getIsPic() {
		return this.isPic;
	}

	public void setIsPic(boolean isPic) {
		this.isPic = isPic;
	}

	public boolean getIsPlay() {
		return this.isPlay;
	}

	public void setIsPlay(boolean isPlay) {
		this.isPlay = isPlay;
	}

	public Clazz getClazz() {
		return clazz;
	}

	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}

	public boolean getIsTop() {
		return this.isTop;
	}

	public void setIsTop(boolean isTop) {
		this.isTop = isTop;
	}

	public String getPicFile() {
		return this.picFile;
	}

	public void setPicFile(String picFile) {
		this.picFile = picFile;
	}

	public String getSortPath() {
		return this.sortPath;
	}

	public void setSortPath(String sortPath) {
		this.sortPath = sortPath;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Clazz getOk3wClass() {
		return this.clazz;
	}

	public void setOk3wClass(Clazz clazz) {
		this.clazz = clazz;
	}

}