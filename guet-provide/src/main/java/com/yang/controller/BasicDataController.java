package com.yang.controller;

import com.yang.pojo.GuetBasicData;
import com.yang.servier.IBasicDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/basic")
public class BasicDataController {

    @Autowired
    private IBasicDataService basicDataService;

    // http://localhost:8888/basic/query
    @GetMapping("/list")
    public List<GuetBasicData> getBasicQuery(){

        return basicDataService.queryAll();
    }

    @GetMapping("/{baseId}")
    public GuetBasicData getById(@PathVariable Integer baseId) {
        return basicDataService.selectById(baseId);
    }

    @PostMapping("/query")
    public List<GuetBasicData> getByName(@RequestBody GuetBasicData data) {
        return basicDataService.selectByName(data.getBaseName());
    }

    @PostMapping("/insert")
    public int insert(@RequestBody GuetBasicData data) {
        return basicDataService.insert(data);
    }

    @PostMapping("/update")
    public int update(@RequestBody GuetBasicData data) {
        return basicDataService.update(data);
    }

    @GetMapping("/delete/{baseId}")
    public int delete(@PathVariable Integer baseId) {
        return basicDataService.deleteById(baseId);
    }

}
