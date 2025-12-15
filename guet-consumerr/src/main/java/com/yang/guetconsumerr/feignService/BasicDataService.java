package com.yang.guetconsumerr.feignService;

import com.yang.pojo.GuetBasicData;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@FeignClient(name = "guet-provide",contextId = "basicFeign")
public interface BasicDataService {


    @GetMapping("/basic/list")
    public List<GuetBasicData> getBasicQuery();

    @GetMapping("/basic/{baseId}")
    GuetBasicData getById(@PathVariable("baseId") Integer baseId);

    @PostMapping("/basic/query")
    List<GuetBasicData> getByName(@RequestBody GuetBasicData data);

    @PostMapping("/basic/insert")
    int insert(@RequestBody GuetBasicData data);

    @PostMapping("/basic/update")
    int update(@RequestBody GuetBasicData data);

    @GetMapping("/basic/delete/{baseId}")
    int delete(@PathVariable("baseId") Integer baseId);

}
