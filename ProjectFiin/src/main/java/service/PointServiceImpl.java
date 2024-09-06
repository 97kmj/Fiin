package service;

import java.util.List;

import dao.PointDao;
import dao.PointDaoImpl;
import dao.PointRecordDao;
import dao.PointRecordDaoImpl;
import dto.Point;
import dto.PointRecord;
import util.PageInfo;

public class PointServiceImpl implements PointService {
	
	private PointDao pointDao;
	private PointRecordDao pointRecordDao;
	public PointServiceImpl() {
		pointDao = new PointDaoImpl();
		pointRecordDao = new PointRecordDaoImpl();
	}
	
	@Override
	public List<Point> pointList() throws Exception {	
		return pointDao.selectPointList();
	}
	@Override
	public void insertPointRecord(String type, Integer num, Integer pointAmount, String detail) throws Exception {
		pointRecordDao.insertPointRecord(type,num, pointAmount, detail);
	}
	
	@Override
	public void updatePointBalance(String type, Integer num, Integer pointAmount) throws Exception {
		pointRecordDao.updatePointBalance(type,num,pointAmount);		
	}
	
	@Override
	public List<PointRecord> showPointRecord(String type, Integer num, PageInfo pageInfo) throws Exception {
		Integer recordCnt= pointRecordDao.selectPointRecordCount(type, num);
		
		Integer allPage = (int)Math.ceil((double)recordCnt/5);
		Integer startPage =	(pageInfo.getCurPage()-1)/5*5+1;  
		Integer endPage = startPage+5-1;
		if(endPage>allPage) endPage = allPage;
		pageInfo.setAllPage(allPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage); 
		Integer row = (pageInfo.getCurPage()-1)*5+1;
		 
		return pointRecordDao.selectPointRecordList(type,num,row);
	}
	@Override
	public Integer getPointBalance(String type, Integer num) throws Exception {
		return pointDao.getPointBalance(type,num);
	}
	
	
}
