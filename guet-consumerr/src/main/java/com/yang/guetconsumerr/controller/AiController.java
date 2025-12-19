package com.yang.guetconsumerr.controller;

import com.yang.guetconsumerr.service.AiService;
import com.yang.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/ai")
public class AiController {

    @Autowired
    private AiService aiService;

    /**
     * AI 聊天接口
     * POST /api/ai/chat
     * Body: { "message": "用户消息" }
     */
    @PostMapping("/chat")
    public Result<String> chat(@RequestBody Map<String, String> request) {
        String message = request.get("message");
        if (message == null || message.trim().isEmpty()) {
            return Result.build("", 400, "消息不能为空");
        }
        
        try {
            String reply = aiService.chat(message);
            return Result.build(reply, 200, "success");
        } catch (Exception e) {
            return Result.build("", 500, "AI服务异常: " + e.getMessage());
        }
    }
}
