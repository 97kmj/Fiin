package service;

import java.util.List;

import dto.Point;

public interface PointService {
	List<Point> pointList() throws Exception;
	void insertPointRecord(String type, Integer num,Integer pointAmount) throws Exception;
	void updatePointBalance(String type, Integer num,Integer pointAmount) throws Exception;
}
