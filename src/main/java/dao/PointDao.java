package dao;

import java.util.List;

import dto.Point;
import dto.PointRecord;

public interface PointDao {
	List<Point> selectPointList() throws Exception;
	Integer getPointBalance(String type, Integer num) throws Exception;
	
}
