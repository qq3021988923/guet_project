package com.yang.controller;

import com.yang.pojo.Brand;
import com.yang.servier.IBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/stock")
public class BrandController {

    @Autowired
    private IBrandService IBrandService;

    //查询所有品牌 http://localhost:8888/stock/reduce
    @GetMapping("/reduce")
    public List<Brand> findAll() {
        return IBrandService.findAll();
    }

}
