package dao;

import java.util.List;

import dto.Point;

public interface PointDao {
	List<Point> selectPointList() throws Exception;
	void insertPointRecord(Integer num, Integer pointAmount) throws Exception;
}
