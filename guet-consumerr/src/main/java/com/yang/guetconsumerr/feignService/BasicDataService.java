package com.yang.guetconsumerr.feignService;

import com.yang.pojo.GuetBasicData;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@FeignClient(name = "guet-provide",contextId = "basicFeign")
public interface BasicDataService {

    @GetMapping("/basic/byParentId/{parentId}")
    public List<GuetBasicData> getbyParentId(@PathVariable Integer parentId);

    @GetMapping("/basic/list")
    public List<GuetBasicData> getBasicQuery();

    @GetMapping("/basic/{baseId}")
    GuetBasicData getById(@PathVariable("baseId") Integer baseId);

    @GetMapping("/basic/query")
    List<GuetBasicData> getByName(@RequestParam("baseName") String baseName);

    @PostMapping("/basic/insert")
    int insert(@RequestBody GuetBasicData data);

    @PostMapping("/basic/update")
    int update(@RequestBody GuetBasicData data);

    @GetMapping("/basic/delete/{baseId}")
    int delete(@PathVariable("baseId") Integer baseId);

}
