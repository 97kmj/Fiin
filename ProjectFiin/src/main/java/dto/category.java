package dto;

public class category {
	private Integer categoryId;
	private String categoryName;
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	@Override
	public String toString() {
		return "category [categoryId=" + categoryId + ", categoryName=" + categoryName + "]";
	}
	public category(Integer categoryId, String categoryName) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}
	public category() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
