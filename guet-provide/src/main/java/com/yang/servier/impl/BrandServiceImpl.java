package com.yang.servier.impl;

import com.yang.mapper.BrandMapper;
import com.yang.pojo.Brand;
import com.yang.servier.IBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BrandServiceImpl implements IBrandService {

    @Autowired
    private BrandMapper brandMapper;

    //查询所有品牌
    @Override
    public List<Brand> findAll() {
        return brandMapper.findByPage();
    }
}