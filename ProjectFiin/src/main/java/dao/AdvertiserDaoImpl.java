package dao;

import org.apache.ibatis.session.SqlSession;

import dto.Advertiser;
import util.MybatisSqlSessionFactory;

public class AdvertiserDaoImpl implements AdvertiserDao {
	private SqlSession sqlsession;
	public AdvertiserDaoImpl() {
		sqlsession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}
	
	@Override
	public void insertAdvertiser(Advertiser advertiser) throws Exception {
		sqlsession.insert("mapper.advertiser.insertAdvertiser", advertiser);
		sqlsession.commit();
	}

	@Override
	public Advertiser selectAdvertiser(Integer advertiserNum) throws Exception {
		return sqlsession.selectOne("mapper.advertiser.selectAdvertiser", advertiserNum);
	}

	@Override
	public void updateAdvertiser(Advertiser advertiser) throws Exception {
		sqlsession.update("mapper.advertiser.updateAdvertiser", advertiser);
		sqlsession.commit();
	}

	@Override
	public Advertiser selectAdvertiserByEmail(String userEmail) throws Exception {
		return sqlsession.selectOne("mapper.advertiser.selectAdvertiserByEmail", userEmail);
	}

}
