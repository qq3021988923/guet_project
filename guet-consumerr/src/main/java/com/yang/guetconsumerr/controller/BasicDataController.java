package com.yang.guetconsumerr.controller;

import com.yang.guetconsumerr.feignService.BasicDataService;
import com.yang.guetconsumerr.feignService.GuetUserService;
import com.yang.pojo.GuetBasicData;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/api/basic")
public class BasicDataController {

    @Autowired
    private BasicDataService basicDataService;

    @Autowired
    private GuetUserService guetUserService;


    // http://localhost:8088/consumer/api/basic/byParentId/2
    @GetMapping("/byParentId/{parentId}")
    public Result<List<GuetBasicData>> getbyParentId(@PathVariable Integer parentId) {



        List<GuetBasicData> guetBasicData = basicDataService.getbyParentId(parentId);
        return Result.build(guetBasicData,guetBasicData == null?500:200,"查询子类列表");

    }

    // http://localhost:8088/consumer/api/basic/data
//    @GetMapping("/data")
//    public HashMap<String,Object> getBasicData() {
//
//
//        return null;
//
//    }


    // http://localhost:8088/consumer/api/basic/list
    @GetMapping("/list")
    public Result<List<GuetBasicData>> getList(){
        List<GuetBasicData> basic = basicDataService.getBasicQuery();
        return Result.build(basic,basic == null?500:200,"基础数据列表");
    }

    //  http://localhost:8088/consumer/api/basic/detail
    @GetMapping("/detail/{baseId}")
    public Result<GuetBasicData> getById(@PathVariable Integer baseId) {
        GuetBasicData data = basicDataService.getById(baseId);
        return Result.build(data, data != null ? 200 : 404, data != null ? "查询成功" : "数据不存在");
    }

    // 根据name查询
    @GetMapping("/query")
    public Result<List<GuetBasicData>> getByName(String baseName) {
        List<GuetBasicData> list = basicDataService.getByName(baseName);
        return Result.build(list, 200, "查询成功");
    }


    @PostMapping("/insert")
    public Result<Integer> insert(@RequestBody GuetBasicData data) {
        int i = basicDataService.insert(data);
        return Result.build(i, i == 0 ? 500 : 200, i == 0 ? "添加失败" : "添加成功");
    }

    @PostMapping("/update")
    public Result<Integer> update(@RequestBody GuetBasicData data) {
        int i = basicDataService.update(data);
        return Result.build(i, i == 0 ? 500 : 200, i == 0 ? "更新失败" : "更新成功");
    }

    @GetMapping("/delete/{baseId}")
    public Result<Integer> delete(@PathVariable Integer baseId) {
        int i = basicDataService.delete(baseId);
        return Result.build(i, i == 0 ? 500 : 200, i == 0 ? "删除失败" : "删除成功");
    }


}
