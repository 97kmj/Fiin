package dao;

import java.util.List;

import dto.Point;

public interface PointDao {
	List<Point> selectPointList() throws Exception;
	void insertPointRecord(String type, Integer num, Integer pointAmount) throws Exception;
	void updatePointBalance(String type, Integer num, Integer pointAmount) throws Exception;
}
