package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class DeviceServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<SecurityDevice> devices = createTestData();
        request.setAttribute("devices", devices);

        // 指向views包下的JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("h5/views/intelligence.jsp");
        dispatcher.forward(request, response);
    }

    private List<SecurityDevice> createTestData() {
        // 1. 创建数据列表
        List<SecurityDevice> devices = new ArrayList<>();

        // 2. 创建第一个设备
        SecurityDevice device1 = new SecurityDevice();
        device1.setVendor("奇安信");
        device1.setProductName("天眼态势感知系统");
        device1.setDescription("新一代网络安全态势感知与安全运营平台");
        device1.setImageUrl("images/qianxin.jpg");
        device1.setFeatures(Arrays.asList(
                "全流量深度分析",
                "威胁情报联动",
                "攻击溯源取证",
                "可视化大屏"
        ));

        // 3. 创建第二个设备
        SecurityDevice device2 = new SecurityDevice();
        device2.setVendor("深信服");
        device2.setProductName("安全感知平台");
        device2.setDescription("全网流量分析与安全威胁检测系统");
        device2.setImageUrl("images/sangfor.jpg");
        device2.setFeatures(Arrays.asList(
                "全流量元数据采集",
                "AI威胁检测",
                "自动化响应处置",
                "云端联动分析"
        ));

        // 4. 添加到列表
        devices.add(device1);
        devices.add(device2);

        return devices;
    }
}