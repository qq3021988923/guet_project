package com.yang.mapper;

import com.yang.pojo.GuetBasicData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BasicDataMapper {

    List<GuetBasicData>selectByParentId(Integer parentId);

    List<GuetBasicData> queryAll();

    GuetBasicData selectById(Integer baseId);

    List<GuetBasicData> selectByName(String baseName);

    int insert(GuetBasicData data);

    int update(GuetBasicData data);

    int deleteById(Integer baseId);

}
