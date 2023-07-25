package com.oyun.config;

import com.oyun.webUtil.Interceptor;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
@EnableWebMvc
@ComponentScan("com.*")
public class WebConfig implements WebMvcConfigurer {

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/jsp");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("classpath:/resources/");
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
    }

    @Bean
    public FilterRegistrationBean encodingFilter(){
        FilterRegistrationBean frb = new FilterRegistrationBean();
        CharacterEncodingFilter charact = new CharacterEncodingFilter();
        charact.setForceEncoding(true);
        charact.setEncoding("UTF-8");
        frb.setFilter(charact);
        return frb;
    }

    @Bean
    public MappingJackson2JsonView jsonView(){
        return new MappingJackson2JsonView();
    }

    @Override
    public void addInterceptors(InterceptorRegistry interceptorRegistry){
        interceptorRegistry.addInterceptor(new Interceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/main/**") // main
                .excludePathPatterns("/login/**") // login
                .excludePathPatterns("/logout/**") // logout
                .excludePathPatterns("/error/**") // 404 ~ 505
                .excludePathPatterns("/main/interceptor/**") // interceptor
                .excludePathPatterns("/static/**"); // image
    }

}
