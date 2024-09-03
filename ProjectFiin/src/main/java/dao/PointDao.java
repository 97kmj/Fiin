package dao;

import java.util.List;

import dto.Point;

public interface PointDao {
	List<Point> selectPointList() throws Exception;
}
