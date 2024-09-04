package service;

import java.util.List;

import dto.Point;

public interface PointService {
	List<Point> pointList() throws Exception;
	void insertPointRecord(Integer num,Integer pointAmount) throws Exception;
}
