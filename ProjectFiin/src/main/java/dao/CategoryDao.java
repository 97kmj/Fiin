package dao;

import dto.Category;

public interface CategoryDao {
	Category selectCategory(Integer categoryNum) throws Exception;
}
