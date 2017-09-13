package LCXMB.controller;

import LCXMB.beans.PCate;
import LCXMB.pojo.Product;
import LCXMB.service.ProductService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import okhttp3.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/10.
 */
@Controller
public class PageIndexController {

    @Resource
    ProductService productService;

    @RequestMapping("/")
    public String index1(ModelMap model, ServletRequest request) throws FileNotFoundException, UnsupportedEncodingException {

        Gson gson = new Gson();

        String baseUrl = request.getServletContext().getRealPath("/");

        FileInputStream fis = new FileInputStream(baseUrl + "/static/json/category.json");
        InputStreamReader isr = new InputStreamReader(fis, "UTF-8");

        JsonParser parser = new JsonParser();
        JsonElement el = parser.parse(isr);

        JsonArray categoryJSON = null;
        if(el.isJsonArray()){
            categoryJSON = el.getAsJsonArray();
        }

        List<PCate> category = gson.fromJson(categoryJSON, new TypeToken<List<PCate>>(){}.getType());

        model.addAttribute("category", category);

        String[] categories = {"数码产品","二手书籍","生活用品","鞋服配饰","美容美颜","虚拟商品"};
        List newCates = new ArrayList<List<Product>>();

        for (String word:categories) {
            List<Product> productList= productService.getProducts(word);
            newCates.add(productList);
        }

        model.addAttribute("newCates", newCates);
        return "/index2";
    }

}
