package com.tist.config;

import com.google.code.kaptcha.servlet.KaptchaServlet;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;

/**
 * Kaptcha驗證碼，設定檔
 *
 * @author Torr
 */
@Component
@ConfigurationProperties(prefix = "tist.kaptcha")
@Data
@Configuration
public class KaptchaConfig {

    private static final String DEFAULT_SESSION_KEY = "kaptcha.code";
    private static final String DEFAULT_FONT_COLOR = "black";
    private static final String DEFAULT_FONT_SIZE = "25";
    private static final String DEFAULT_OBSCURIFICATOR_IMPL = "com.google.code.kaptcha.impl.ShadowGimpy";
    private static final String DEFAULT_NOISE_IMPL = "com.google.code.kaptcha.impl.NoNoise";
    private static final String DEFAULT_IMAGE_WIDTH = "100";
    private static final String DEFAULT_IMAGE_HEIGHT = "40";
    private static final String DEFAULT_CHAR_LENGTH = "4";
    private static final String DEFAULT_CHAR_STRING = "abcde2345678gfynmnpwx";
    private static final String DEFAULT_CHAR_SPACE = "5";
    private static final String DEFAULT_BACKGROUND_CLEAR_FROM = "247,247,247";
    private static final String DEFAULT_BACKGROUND_CLEAR_TO = "247,247,247";

    /**
     * Session Attribute Name
     * session.getAttribute("kaptcha.code")
     */
    @Value("${kaptcha.session.key}")
    private String sessionKey;
    /**
     * 驗證碼文字顏色
     */
    @Value("${kaptcha.textproducer.font.color}")
    private String fontColor;
    /**
     * 驗證碼文字大小
     */
    @Value("${kaptcha.textproducer.font.size}")
    private String fontSize;
    /**
     * 驗證碼樣式引擎
     */
    @Value("${kaptcha.obscurificator.impl}")
    private String obscurificatorImpl;
    /**
     * 驗證碼噪點生成對象
     */
    @Value("${kaptcha.noise.impl}")
    private String noiseImpl;
    /**
     * 驗證碼圖片寬度(px)
     */
    @Value("${kaptcha.image.width}")
    private String imageWidth;
    /**
     * 驗證碼圖片高度(px)
     */
    @Value("${kaptcha.image.height}")
    private String imageHeight;
    /**
     * 驗證碼字數長度
     */
    @Value("${kaptcha.textproducer.char.length}")
    private String charLength;
    /**
     * 驗證碼文字內容範圍
     * 預設為abcde2345678gfynmnpwx
     */
    @Value("${kaptcha.textproducer.char.string}")
    private String charString;
    /**
     * 驗證碼文字間距
     */
    @Value("${kaptcha.textproducer.char.space}")
    private String charSpace;
    /**
     * 驗證碼背景顏色漸進起始顏色
     */
    @Value("${kaptcha.background.clear.from}")
    private String backgroundClearFrom;
    /**
     * 驗證碼背景顏色漸進結束顏色
     */
    @Value("${kaptcha.background.clear.to}")
    private String backgroundClearTo;

    @Bean
    public ServletRegistrationBean servletRegistrationBean() throws ServletException {
        ServletRegistrationBean servlet = new ServletRegistrationBean(
                new KaptchaServlet(), "/images/kaptcha.jpg");
        servlet.addInitParameter("kaptcha.border", "no");
        servlet.addInitParameter("kaptcha.session.key", getSessionKey());//session key
        servlet.addInitParameter("kaptcha.textproducer.font.color", getFontColor());
        servlet.addInitParameter("kaptcha.textproducer.font.size", getFontSize());
        servlet.addInitParameter("kaptcha.obscurificator.impl", getObscurificatorImpl());
        servlet.addInitParameter("kaptcha.noise.impl", getNoiseImpl());
        servlet.addInitParameter("kaptcha.image.width", getImageWidth());
        servlet.addInitParameter("kaptcha.image.height", getImageHeight());
        servlet.addInitParameter("kaptcha.textproducer.char.length", getCharLength());
        servlet.addInitParameter("kaptcha.textproducer.char.space", getCharSpace());
        servlet.addInitParameter("kaptcha.textproducer.char.string", getCharString());
        servlet.addInitParameter("kaptcha.background.clear.from", getBackgroundClearFrom()); //和登录框背景颜色一致
        servlet.addInitParameter("kaptcha.background.clear.to", getBackgroundClearTo());
        return servlet;
    }

    public String getSessionKey() {
        return (!StringUtils.isEmpty(sessionKey)) ? sessionKey
                : DEFAULT_SESSION_KEY;
    }

    public String getFontColor() {
        return (!StringUtils.isEmpty(fontColor)) ? fontColor
                : DEFAULT_FONT_COLOR;
    }

    public String getFontSize() {
        return (!StringUtils.isEmpty(fontSize)) ? fontSize
                : DEFAULT_FONT_SIZE;
    }

    public String getObscurificatorImpl() {
        return (!StringUtils.isEmpty(obscurificatorImpl)) ? obscurificatorImpl
                : DEFAULT_OBSCURIFICATOR_IMPL;
    }

    public String getNoiseImpl() {
        return (!StringUtils.isEmpty(noiseImpl)) ? noiseImpl
                : DEFAULT_NOISE_IMPL;
    }

    public String getImageWidth() {
        return (!StringUtils.isEmpty(imageWidth)) ? imageWidth
                : DEFAULT_IMAGE_WIDTH;
    }

    public String getImageHeight() {
        return (!StringUtils.isEmpty(imageHeight)) ? imageHeight
                : DEFAULT_IMAGE_HEIGHT;
    }

    public String getCharLength() {
        return (!StringUtils.isEmpty(charLength)) ? charLength
                : DEFAULT_CHAR_LENGTH;
    }

    public String getCharString() {
        return (!StringUtils.isEmpty(charString)) ? charString
                : DEFAULT_CHAR_STRING;
    }

    public String getCharSpace() {
        return (!StringUtils.isEmpty(charSpace)) ? charSpace
                : DEFAULT_CHAR_SPACE;
    }

    public String getBackgroundClearFrom() {
        return (!StringUtils.isEmpty(backgroundClearFrom)) ? backgroundClearFrom
                : DEFAULT_BACKGROUND_CLEAR_FROM;
    }

    public String getBackgroundClearTo() {
        return (!StringUtils.isEmpty(backgroundClearTo)) ? backgroundClearTo
                : DEFAULT_BACKGROUND_CLEAR_TO;
    }
}
