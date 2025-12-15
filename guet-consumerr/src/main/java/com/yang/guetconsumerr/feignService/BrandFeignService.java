package com.yang.guetconsumerr.feignService;


import com.yang.pojo.Brand;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@FeignClient(name = "guet-provide",contextId = "brandFeign")
public interface BrandFeignService {

    @GetMapping("/stock/reduce")
    public List<Brand> findAll();
}
