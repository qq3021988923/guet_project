package com.yang.servier.impl;

import com.yang.mapper.BasicDataMapper;
import com.yang.pojo.GuetBasicData;
import com.yang.servier.IBasicDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BasicDataServiceImpl implements IBasicDataService {

    @Autowired
    private BasicDataMapper basicDataMapper;

    @Override
    public List<GuetBasicData> queryAll() {
        return basicDataMapper.queryAll();
    }

    @Override
    public GuetBasicData selectById(Integer baseId) {
        return basicDataMapper.selectById(baseId);
    }

    @Override
    public List<GuetBasicData> selectByName(String baseName) {
        return basicDataMapper.selectByName(baseName);
    }

    @Override
    public int insert(GuetBasicData data) {
        return basicDataMapper.insert(data);
    }

    @Override
    public int update(GuetBasicData data) {
        return basicDataMapper.update(data);
    }

    @Override
    public int deleteById(Integer baseId) {
        return basicDataMapper.deleteById(baseId);
    }

}
