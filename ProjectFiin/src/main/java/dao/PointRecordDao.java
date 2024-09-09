package dao;

import java.util.List;

import dto.PointRecord;

public interface PointRecordDao {
	void insertPointRecord(String type, Integer num, Integer pointAmount,String detail) throws Exception;
	List<PointRecord> selectPointRecordList(String type, Integer num, Integer row) throws Exception;
	Integer selectPointRecordCount(String type, Integer num) throws Exception;
	void updatePointBalance(String type, Integer num, Integer pointAmount) throws Exception;
}
