package com.yang.guetconsumerr.controller;

import com.yang.guetconsumerr.feignService.BrandFeignService;
import com.yang.pojo.Brand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/brand")
@CrossOrigin
public class BrandController {

    @Autowired
    BrandFeignService brandFeignService;

    // http://localhost:8088/consumer/api/brand/query
    @RequestMapping("/query")
    public List<Brand> queryAllBrand() {
       return brandFeignService.findAll();
    }
}
