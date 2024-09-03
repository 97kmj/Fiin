package service;

import java.util.List;

import dao.PointDao;
import dao.PointDaoImpl;
import dto.Point;

public class PointServiceImpl implements PointService {
	
	private PointDao pointDao;
	public PointServiceImpl() {
		pointDao = new PointDaoImpl();
	}
	
	@Override
	public List<Point> pointList() throws Exception {	
		return pointDao.selectPointList();
	}
}
