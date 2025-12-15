package com.yang.servier;

import com.yang.pojo.GuetBasicData;

import java.util.List;

public interface IBasicDataService {

    List<GuetBasicData> queryAll();

    GuetBasicData selectById(Integer baseId);

    List<GuetBasicData> selectByName(String baseName);

    int insert(GuetBasicData data);

    int update(GuetBasicData data);

    int deleteById(Integer baseId);

}
