package com.yang.guetconsumerr.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yang.guetconsumerr.feignService.GuetOrderService;
import com.yang.guetconsumerr.feignService.LogisticsService;
import com.yang.pojo.GuetLogistics;
import com.yang.pojo.GuetOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class AiService {

    @Value("${ai.deepseek.api-key:}")
    private String apiKey;

    @Value("${ai.deepseek.api-url:https://api.deepseek.com/chat/completions}")
    private String apiUrl;

    @Autowired
    private GuetOrderService orderService;

    @Autowired
    private LogisticsService logisticsService;

    // 系统提示词
    private static final String SYSTEM_PROMPT = """
        你是羊城货运平台的智能客服助手"小羊"，请用简洁友好的语言回答用户问题。
        
        你可以帮助用户：
        1. 解答物流相关问题（运费计算、配送时间、运输方式等）
        2. 指导如何使用系统（下单流程、查询订单、客户管理等）
        3. 解答常见问题
        
        注意事项：
        - 回答要简洁明了，不要太长
        - 如果不确定，建议用户联系人工客服
        - 保持友好专业的态度
        - 如果用户提供了订单信息，直接使用提供的信息回答
        - 不要使用Markdown格式，直接用纯文本回复，用换行分隔信息
        """;

    /**
     * 调用 DeepSeek API 进行对话
     */
    public String chat(String userMessage) throws Exception {
        // 先检查是否是订单查询
        String orderInfo = tryQueryOrder(userMessage);
        String finalMessage = userMessage;
        
        if (orderInfo != null) {
            // 如果查到订单信息，把信息附加给AI
            finalMessage = userMessage + "\n\n【系统查询到的订单信息】\n" + orderInfo + "\n请根据以上信息回答用户。";
        }

        // 构建请求体
        JSONObject requestBody = new JSONObject();
        requestBody.put("model", "deepseek-chat");
        
        JSONArray messages = new JSONArray();
        
        // 系统消息
        JSONObject systemMsg = new JSONObject();
        systemMsg.put("role", "system");
        systemMsg.put("content", SYSTEM_PROMPT);
        messages.add(systemMsg);
        
        // 用户消息
        JSONObject userMsg = new JSONObject();
        userMsg.put("role", "user");
        userMsg.put("content", finalMessage);
        messages.add(userMsg);
        
        requestBody.put("messages", messages);
        requestBody.put("max_tokens", 1000);
        requestBody.put("temperature", 0.7);

        // 发送请求
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Authorization", "Bearer " + apiKey);
        conn.setDoOutput(true);
        conn.setConnectTimeout(30000);
        conn.setReadTimeout(60000);

        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = requestBody.toJSONString().getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }

        int responseCode = conn.getResponseCode();
        
        StringBuilder response = new StringBuilder();
        try (BufferedReader br = new BufferedReader(
                new InputStreamReader(
                        responseCode == 200 ? conn.getInputStream() : conn.getErrorStream(),
                        StandardCharsets.UTF_8))) {
            String line;
            while ((line = br.readLine()) != null) {
                response.append(line);
            }
        }

        if (responseCode != 200) {
            throw new RuntimeException("API调用失败: " + response);
        }

        // 解析响应
        JSONObject jsonResponse = JSON.parseObject(response.toString());
        JSONArray choices = jsonResponse.getJSONArray("choices");
        if (choices != null && !choices.isEmpty()) {
            JSONObject choice = choices.getJSONObject(0);
            JSONObject message = choice.getJSONObject("message");
            return message.getString("content");
        }

        return "抱歉，我暂时无法回答这个问题。";
    }

    /**
     * 尝试从用户消息中提取订单号并查询
     */
    private String tryQueryOrder(String message) {
        // 匹配订单号模式（如：ORD001, 订单123, DD20231201 等）
        Pattern pattern = Pattern.compile("(?:订单|单号|ORD|DD)?\\s*([A-Za-z]*\\d{3,})", Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(message);
        
        if (matcher.find()) {
            String orderNo = matcher.group(1);
            // 如果只有数字，加上前缀尝试
            if (orderNo.matches("\\d+")) {
                return queryOrderByNumber(orderNo);
            }
            return queryOrderByNumber(orderNo);
        }
        
        // 检查是否包含查询关键词
        if (message.contains("查") && (message.contains("订单") || message.contains("物流") || message.contains("快递"))) {
            // 尝试提取纯数字
            Pattern numPattern = Pattern.compile("(\\d{3,})");
            Matcher numMatcher = numPattern.matcher(message);
            if (numMatcher.find()) {
                return queryOrderByNumber(numMatcher.group(1));
            }
        }
        
        return null;
    }

    /**
     * 根据订单号查询订单信息
     */
    private String queryOrderByNumber(String orderNo) {
        try {
            // 模糊查询订单
            GuetOrder queryOrder = new GuetOrder();
            queryOrder.setNum(orderNo);

            List<GuetOrder> orders = orderService.query(queryOrder);
            
            if (orders == null || orders.isEmpty()) {
                return "未找到订单号包含 " + orderNo + " 的订单";
            }
            
            GuetOrder order = orders.get(0);
            StringBuilder info = new StringBuilder();
            info.append("订单号: ").append(order.getNum()).append("\n");
            info.append("货物名称: ").append(order.getName()).append("\n");
            info.append("收货人: ").append(order.getPerson()).append("\n");
            info.append("联系电话: ").append(order.getPhone()).append("\n");
            info.append("收货地址: ").append(order.getCiti()).append(" ").append(order.getAddress()).append("\n");
            info.append("运输方式: ").append(order.getShipping()).append("\n");
            info.append("订单金额: ¥").append(order.getTotal()).append("\n");
            
            // 查询物流状态
            try {
                GuetLogistics logistics = logisticsService.getLatestByOrderId(order.getId());
                if (logistics != null) {
                    String statusText = getStatusText(logistics.getStatus());
                    info.append("物流状态: ").append(statusText).append("\n");
                    if (logistics.getLocation() != null) {
                        info.append("当前位置: ").append(logistics.getLocation()).append("\n");
                    }
                    if (logistics.getRemark() != null) {
                        info.append("备注: ").append(logistics.getRemark()).append("\n");
                    }
                } else {
                    info.append("物流状态: 暂无物流信息\n");
                }
            } catch (Exception e) {
                info.append("物流状态: 查询失败\n");
            }
            
            return info.toString();
        } catch (Exception e) {
            return "查询订单时出错: " + e.getMessage();
        }
    }

    /**
     * 物流状态码转文字
     */
    private String getStatusText(Integer status) {
        if (status == null) return "未知";
        return switch (status) {
            case 1 -> "待取件";
            case 2 -> "已取件";
            case 3 -> "运输中";
            case 4 -> "已送达";
            case 5 -> "已签收";
            default -> "未知";
        };
    }
}
