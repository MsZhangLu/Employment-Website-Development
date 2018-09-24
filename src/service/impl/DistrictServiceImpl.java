package service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import bean.District;
import mapper.DistrictMapper;
import service.DistrictService;

public class DistrictServiceImpl implements DistrictService{

	@Autowired(required=false)
	public DistrictMapper dm;
	
	public District findDistrict(int id) {
		District district = new District();
		district.setId(1);
		System.out.println(district.getId());
		return dm.findDistrict(district);
	}
	
}
