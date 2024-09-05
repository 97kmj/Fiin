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
	@Override
	public void insertPointRecord(String type, Integer num, Integer pointAmount) throws Exception {
		pointDao.insertPointRecord(type,num, pointAmount);
	}
	
	@Override
	public void updatePointBalance(String type, Integer num, Integer pointAmount) throws Exception {
		pointDao.updatePointBalance(type,num,pointAmount);		
	}
}
