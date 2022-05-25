package com.min.edu.socket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

@Configuration
@EnableWebSocketMessageBroker//메시지 플로우를 모으기 위해 컴포넌트를 구성
public class StompWebSocketConfig extends AbstractWebSocketMessageBrokerConfigurer{
    /*
     * clientInboundChannel : 
     *  - WebSocket Client로부터 들어오는 요청을 전달하며,
     * 	   WebSocketMessageBrokerConfigurer를 통해 intercept, taskExecutor를 
     *     설정할 수 있다. 클라이언트로 받은 메세지를 전달
     * 
     * clientOutboundChannel : 
     *  - WebSocket Client로 Server의 메세지를 내보내며, 
     *     WebSocketMessageBrokerConfigurer를 통해 intercept, taskExecutor를 
     *     설정할 수 있다.
     *     클라이언트에게 메세지를 전달
     */

	@Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/stomp/chat").setAllowedOrigins("http://localhost:8077").withSockJS();
        //WebSocket 또는 SockJS Client가 웹소켓 핸드셰이크 커넥션을 생성할 경로이다.
    }
	
	//**brokerChannel: 어플리케이션에서 브로커에게 메시지를 전송하기 위해 사용하는 채널
	
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
    	config.setApplicationDestinationPrefixes("/pub");//송신
    	//pub 경로로 시작하는 STOMP 메세지의 "destination" 헤더는 
    	// @Controller 객체의 @MessageMapping 메서드로 라우팅된다.
        config.enableSimpleBroker("/sub");//수신
    }
}
