package service;

import java.util.List;

import dto.Point;
import dto.PointRecord;
import util.PageInfo;

public interface PointService {
	List<Point> pointList() throws Exception;
	void insertPointRecord(String type, Integer num,Integer pointAmount) throws Exception;
	void updatePointBalance(String type, Integer num,Integer pointAmount) throws Exception;
	List<PointRecord> showPointRecord(String type, Integer num, PageInfo pageInfo) throws Exception;
	
}
